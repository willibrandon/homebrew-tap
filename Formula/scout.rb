# typed: false
# frozen_string_literal: true

# Homebrew formula for Scout - ripgrep-compatible .NET Native AOT search
class Scout < Formula
  desc "Feature-complete port of ripgrep to .NET Native AOT"
  homepage "https://github.com/willibrandon/scout"
  license "MIT"
  version "0.4.3"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-arm64.tar.gz"
      sha256 "ae18960b4c64c10cbdc8559489528971d3f59fc9fdc0cffc685b3fa9a2159e8f"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-x64.tar.gz"
      sha256 "ac679d35acab6ee77823dfc8d4d0a4c0a1182e63a0017e8dd4b46b3edc7d4f0b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-arm64.tar.gz"
      sha256 "7f903d693f0f264894a63ed845c4c9b73b7f79c71fa773ce12217b3c796c4a43"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-x64.tar.gz"
      sha256 "0d2402f34c1b1a1988034137254e2b4509e07eabdc248383dfe01e6f8a05bd7f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"scout"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scout --version")
  end
end
