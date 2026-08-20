# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider-mcp - MCP server for .NET assembly analysis
class DotsiderMcp < Formula
  desc "MCP server for AI-assisted .NET assembly analysis"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.26.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-arm64.tar.gz"
      sha256 "07733a4483225ac049e30105a0c84d15b5c7e7328971fcb429ef5e410ddcb445"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-x64.tar.gz"
      sha256 "a8fa356aadf46abf6d65dff9046b3a12b258985131c457e25f298fbe6a56df11"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-arm64.tar.gz"
      sha256 "3ab5a329f0f4a7ab57d535fd62945b5ec808d18552573f94b25670c58d5d96ec"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-x64.tar.gz"
      sha256 "4aeb3ad96f43ec5735b4bfd01fdcbd368dec0ddea006880d123f7ebe2134221d"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dotsider-mcp"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotsider-mcp --version")
  end
end
