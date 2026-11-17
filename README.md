# homebrew-tap

A [Homebrew](https://brew.sh) tap for macOS apps and tools I maintain.

## Use

```sh
brew tap GAM3RG33K/tap
brew install --cask GAM3RG33K/tap/<name>
```

You can also install without tapping first:

```sh
brew install --cask GAM3RG33K/tap/<name>
```

Update and remove as usual:

```sh
brew upgrade --cask <name>
brew uninstall --cask <name>
brew untap GAM3RG33K/tap
```

## Available casks

| Cask | Description |
| --- | --- |
| [`unrestor`](https://github.com/GAM3RG33K/unrestor) | Keep a MacBook awake with the lid closed |

## How this repo is maintained

Cask files in `Casks/` are updated automatically by each project's release
workflow, which sets the version and SHA-256 when a new release is published.
Please don't edit them by hand: changes are overwritten on the next release.
Each cask's source of truth lives in its own project repository.

## Trust

Casks download release files from the project's GitHub Releases and verify them
against the SHA-256 recorded in the cask. Read a cask before installing it:

```sh
brew cat --cask GAM3RG33K/tap/<name>
```

Some of these apps are not notarized by Apple, because they are built without a
paid developer account. A cask says so in its description or caveats when that
applies.

## Issues

Problems with an app belong in that app's own repository. Problems with the tap
itself (a cask that won't install, a wrong checksum) can be opened here.

## License

Cask files are published under the [MIT License](LICENSE) unless a file says
otherwise. Each app has its own license in its own repository.
