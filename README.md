# Homebrew Tap for pgtail

This tap provides Homebrew formulae for [pgtail](https://github.com/willibrandon/pgtail), an interactive PostgreSQL log tailer with auto-detection and color output.

## Installation

```bash
brew tap willibrandon/tap
brew install pgtail
```

Or install directly:

```bash
brew install willibrandon/tap/pgtail
```

## Upgrade

```bash
brew upgrade pgtail
```

## Supported Platforms

| Platform | Architecture | Binary |
|----------|--------------|--------|
| macOS | Apple Silicon (arm64) | pgtail-macos-arm64 |
| macOS | Intel (x86_64) | pgtail-macos-x86_64 |
| Linux | arm64 | pgtail-linux-arm64 |
| Linux | x86_64 | pgtail-linux-x86_64 |

## Usage

```bash
# List detected PostgreSQL instances
pgtail list-instances

# Tail logs for instance 0
pgtail tail 0

# Show version
pgtail --version
```

For full documentation, see the [pgtail repository](https://github.com/willibrandon/pgtail).

## Troubleshooting

### macOS Gatekeeper Warning

If you see "cannot be opened because the developer cannot be verified":

```bash
xattr -d com.apple.quarantine $(which pgtail)
```

### Formula Issues

To report issues with this tap, please open an issue on the [pgtail repository](https://github.com/willibrandon/pgtail/issues).
