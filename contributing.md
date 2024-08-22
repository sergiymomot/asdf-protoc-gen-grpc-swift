# Contributing

Testing Locally:

```shell
asdf plugin test <plugin-name> <plugin-url> [--asdf-tool-version <version>] [--asdf-plugin-gitref <git-ref>] [test-command*]

asdf plugin test protoc-gen-grpc-swift https://github.com/sergiymomot/asdf-protoc-gen-grpc-swift.git "protoc-gen-grpc-swift --version && protoc-gen-swift --version"
```

Tests are automatically run in GitHub Actions on push and PR.
