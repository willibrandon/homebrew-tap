# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider-mcp - MCP server for .NET assembly analysis
class DotsiderMcp < Formula
  desc "MCP server for AI-assisted .NET assembly analysis"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.14.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-osx-arm64.tar.gz"
      sha256 "4cd2330a7c54b202be97561c22d59491ab3639079b02dfd44ee9f479395c1c1e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-arm64.tar.gz"
      sha256 "ab678632e5e6bdde743c6ba01075c03d3ec06f7bcc2559baaeaad66e2a2ebb3c"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-mcp-linux-x64.tar.gz"
      sha256 "fae9b6bebcce9dd8cf629938b3269de603f881a1706596d0bfc4cde26da3ff01"
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
