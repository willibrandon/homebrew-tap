# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider - .NET assembly analyzer TUI
class Dotsider < Formula
  desc "A TUI for analyzing .NET assemblies"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-arm64.tar.gz"
      sha256 "PLACEHOLDER"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-x64.tar.gz"
      sha256 "PLACEHOLDER"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dotsider"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotsider --version")
  end
end
