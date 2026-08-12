# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider-mcp - MCP server for .NET assembly analysis
class DotsiderMcp < Formula
  desc "MCP server for AI-assisted .NET assembly analysis"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.25.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-arm64.tar.gz"
      sha256 "97cdd85060ec8acec06f239b1f6a21d92727dba213f891dd021fa41f634af42e"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-x64.tar.gz"
      sha256 "62fd576d87e77b81da27d8561c594e23367cca9266079ae1af48c04b48c4d922"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-arm64.tar.gz"
      sha256 "012d2d2d1f81675da8fcb1502bbaeb2c896e016d12718fdf1a4e48afd9dae629"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-x64.tar.gz"
      sha256 "9e2b450549d46b1e62549e61b2c08bdae32066bebc45158a17a8b7aa13f413a1"
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
