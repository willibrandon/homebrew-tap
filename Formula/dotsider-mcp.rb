# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider-mcp - MCP server for .NET assembly analysis
class DotsiderMcp < Formula
  desc "MCP server for AI-assisted .NET assembly analysis"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.14.2"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-arm64.tar.gz"
      sha256 "9c64638d0165e4741144007e88686c1259e50f31cd2587216df2ccbb2a6990a5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-arm64.tar.gz"
      sha256 "4c974640c45497a75a5d0d6da0e93da676e8b3bc0d4d5b91de93a2a57af2fcec"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-x64.tar.gz"
      sha256 "28eacea3a55ccc99deab66072aad37a7dd8639a5a8e4f4e2b7162cc0a43465dd"
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
