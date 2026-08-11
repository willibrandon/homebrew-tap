# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider - .NET assembly analyzer TUI
class Dotsider < Formula
  desc "A TUI for analyzing .NET assemblies"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.24.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-arm64.tar.gz"
      sha256 "31ae6261c4b0b389d06593545c1ca9c150d2d77df6c9a5bdcfd1428669fa4902"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-x64.tar.gz"
      sha256 "aaa6ec396035e335112b1826fa30dca1140541c44ad6e7a08b707eaa7cc32e87"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-arm64.tar.gz"
      sha256 "47503e908f8e32d3c8999df86a9e46578d7117897058abf928498c0c4f7dfaf4"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-x64.tar.gz"
      sha256 "2525475560403ecfbff4bc7875e31f489790c20f51fad467b3e9ce097286c7cd"
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
