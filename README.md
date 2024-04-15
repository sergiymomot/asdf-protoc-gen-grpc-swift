<div align="center">

# asdf-protoc-gen-grpc-swift [![Build](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/build.yml/badge.svg)](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/build.yml) [![Lint](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/lint.yml/badge.svg)](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/lint.yml)

[protoc-gen-grpc-swift](https://github.com/grpc/grpc-swift/blob/main/docs/plugin.md) plugin for the [asdf version manager](https://asdf-vm.com).
Please note that in addition to `protoc-gen-grpc-swift` protobuf compiler plugin, `protoc-gen-swift` plugin will be installed as well.
At the moment, [swift-protobuf](https://github.com/apple/swift-protobuf) repository does not provide prebuilt binaries for its `protoc` plugin while [grpc-swift](https://github.com/grpc/grpc-swift) provides both.

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `unzip`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).

# Install

Plugin:

```shell
asdf plugin add protoc-gen-grpc-swift
# or
asdf plugin add protoc-gen-grpc-swift https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift.git
```

protoc-gen-grpc-swift:

```shell
# Show all installable versions
asdf list-all protoc-gen-grpc-swift

# Install specific version
asdf install protoc-gen-grpc-swift latest

# Set a version globally (on your ~/.tool-versions file)
asdf global protoc-gen-grpc-swift latest

# Now protoc-gen-grpc-swift (and protoc-gen-swift) commands are available
protoc-gen-grpc-swift --version
protoc-gen-swift --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Sergiy Momot](https://github.com/sergiymomot/)
