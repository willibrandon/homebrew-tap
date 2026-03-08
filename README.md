# Homebrew Tap

This tap provides Homebrew formulae for tools by [willibrandon](https://github.com/willibrandon).

## Formulae

| Formula | Description |
|---------|-------------|
| [dotsider](https://github.com/willibrandon/dotsider) | A TUI for analyzing .NET assemblies |
| [pgtail](https://github.com/willibrandon/pgtail) | Interactive PostgreSQL log tailer with auto-detection and color output |

## Installation

```bash
brew tap willibrandon/tap
brew install dotsider
brew install pgtail
```

Or install directly:

```bash
brew install willibrandon/tap/dotsider
brew install willibrandon/tap/pgtail
```

## Upgrade

```bash
brew upgrade dotsider
brew upgrade pgtail
```

## Supported Platforms

### dotsider

| Platform | Architecture | Binary |
|----------|--------------|--------|
| macOS | Apple Silicon (arm64) | dotsider-osx-arm64 |
| Linux | arm64 | dotsider-linux-arm64 |
| Linux | x86_64 | dotsider-linux-x64 |

### pgtail

| Platform | Architecture | Binary |
|----------|--------------|--------|
| macOS | Apple Silicon (arm64) | pgtail-macos-arm64 |
| macOS | Intel (x86_64) | pgtail-macos-x86_64 |
| Linux | arm64 | pgtail-linux-arm64 |
| Linux | x86_64 | pgtail-linux-x86_64 |

## Troubleshooting

### macOS Gatekeeper Warning

If you see "cannot be opened because the developer cannot be verified":

```bash
xattr -d com.apple.quarantine $(which dotsider)
xattr -d com.apple.quarantine $(which pgtail)
```

### Formula Issues

To report issues with this tap, please open an issue on the relevant repository:
- [dotsider issues](https://github.com/willibrandon/dotsider/issues)
- [pgtail issues](https://github.com/willibrandon/pgtail/issues)
