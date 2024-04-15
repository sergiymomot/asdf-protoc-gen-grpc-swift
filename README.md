<div align="center">

# asdf-protoc-gen-grpc-swift [![Build](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/build.yml/badge.svg)](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/build.yml) [![Lint](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/lint.yml/badge.svg)](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/actions/workflows/lint.yml)

[protoc-gen-grpc-swift](https://github.com/grpc/grpc-swift/blob/main/docs/plugin.md) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

**TODO: adapt this section**

- `bash`, `curl`, `tar`, and [POSIX utilities](https://pubs.opengroup.org/onlinepubs/9699919799/idx/utilities.html).
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

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

# Now protoc-gen-grpc-swift commands are available
protoc-gen-swift --version <TOOL CHECK><TOOL CHECK> protoc-gen-grpc-swift --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Sergiy Momot](https://github.com/sergiymomot/)