#!/usr/bin/env bash

set -euo pipefail

GH_REPO="https://github.com/grpc/grpc-swift"
TOOL_NAME="protoc-gen-grpc-swift"
TOOL_TEST_GEN_SWIFT="protoc-gen-swift --version"
TOOL_TEST_GEN_GRPC_SWIFT="protoc-gen-grpc-swift --version"

fail() {
	echo -e "asdf-$TOOL_NAME: $*"
	exit 1
}

curl_opts=(-fsSL)

# NOTE: You might want to remove this if protoc-gen-grpc-swift is not hosted on GitHub releases.
if [ -n "${GITHUB_API_TOKEN:-}" ]; then
	curl_opts=("${curl_opts[@]}" -H "Authorization: token $GITHUB_API_TOKEN")
fi

sort_versions() {
	sed 'h; s/[+-]/./g; s/.p\([[:digit:]]\)/.z\1/; s/$/.z/; G; s/\n/ /' |
		LC_ALL=C sort -t. -k 1,1 -k 2,2n -k 3,3n -k 4,4n -k 5,5n | awk '{print $2}'
}

list_github_tags() {
	git ls-remote --tags --refs "$GH_REPO" |
		grep -o 'refs/tags/.*' | cut -d/ -f3- |
		sed 's/^v//'
}

list_all_versions() {
	list_github_tags
}

download_release() {
	local version filename url
	version="$1"
	filename="$2"
	url="$GH_REPO/releases/download/${version}/protoc-grpc-swift-plugins-${version}.zip"

	echo "* Downloading $TOOL_NAME release $version..."
	curl "${curl_opts[@]}" -o "$filename" -C - "$url" || fail "Could not download $url"
}

install_version() {
	local install_type="$1"
	local version="$2"
	local install_path="${3%/bin}/bin"
	local skip_protoc_gen_swift
	skip_protoc_gen_swift="$(eval "echo ${MISE_TOOL_OPTS__SKIP_PROTOC_GEN_SWIFT_INSTALL-}")"

	if [ "$install_type" != "version" ]; then
		fail "asdf-$TOOL_NAME supports release installs only"
	fi

	(
		mkdir -p "$install_path"

		if [[ "$skip_protoc_gen_swift" =~ ^(true|TRUE|1)$ ]]; then
			echo "Skipping protoc-gen-swift installation"

			cp -r "$ASDF_DOWNLOAD_PATH/bin/$TOOL_NAME" "$install_path"
			local tool_cmd
			tool_cmd="$(echo "$TOOL_TEST_GEN_GRPC_SWIFT" | cut -d' ' -f1)"
			test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."
		else
			cp -r "$ASDF_DOWNLOAD_PATH"/bin/* "$install_path"

			declare -a test_cmds=("$TOOL_TEST_GEN_SWIFT" "$TOOL_TEST_GEN_GRPC_SWIFT")
			for TOOL_TEST in "${test_cmds[@]}"; do
				local tool_cmd
				tool_cmd="$(echo "$TOOL_TEST" | cut -d' ' -f1)"
				test -x "$install_path/$tool_cmd" || fail "Expected $install_path/$tool_cmd to be executable."
			done
		fi

		echo "$TOOL_NAME $version installation was successful!"
	) || (
		rm -rf "$install_path"
		fail "An error occurred while installing $TOOL_NAME $version."
	)
}
