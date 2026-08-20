# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider - .NET assembly analyzer TUI
class Dotsider < Formula
  desc "A TUI for analyzing .NET assemblies"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.26.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-arm64.tar.gz"
      sha256 "d0407d644a14fd9c363041fd15d30c33ec5a9dfdd053185a78162e05586fb132"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-x64.tar.gz"
      sha256 "c66115ee618c32e193a822663b7d7b3409215dec781a6e9c7d64973db2e206dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-arm64.tar.gz"
      sha256 "b9913c21e4c4e46eda52aeec3279dbb3e80822b44a54dbbe2f7569cf5c63729d"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-x64.tar.gz"
      sha256 "5835e50a2cd8acdd8e298cc5ecfa4a3f14c6d436d658aa5fb5702c754130400e"
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
