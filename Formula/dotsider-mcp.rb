# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider-mcp - MCP server for .NET assembly analysis
class DotsiderMcp < Formula
  desc "MCP server for AI-assisted .NET assembly analysis"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.24.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-arm64.tar.gz"
      sha256 "4dc9db5c8f638b36f0b5b6439b1e2eed8c829cb497abdf2e57368147ec9f8349"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-x64.tar.gz"
      sha256 "38ced00dd1ea095f35a2480a8ef1398102114073c47ca8c744e6239275608172"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-arm64.tar.gz"
      sha256 "4aff46344df5b5b07980631f9e2a3c4d99c114332e79f6e37d0d6bb25de9ba7a"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-x64.tar.gz"
      sha256 "64eadf1794e17f0fde9757a1c7169813402e29397fd953e417958e037342595a"
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
