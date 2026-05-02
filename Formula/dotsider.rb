# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider - .NET assembly analyzer TUI
class Dotsider < Formula
  desc "A TUI for analyzing .NET assemblies"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.14.2"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-arm64.tar.gz"
      sha256 "cf37428940c4208d1290196fc8e20883dae8c1de942a835a59f9b1b93338f055"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-arm64.tar.gz"
      sha256 "3f74d0ae876471ce4a0dbf3ae65db5bb458603e842342f50198e5f6d56e7eeba"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-x64.tar.gz"
      sha256 "114d0b8ae97e6e552ee001cc1fa1064b55660eb6fbd39453c9d4ee8cfdef3845"
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
