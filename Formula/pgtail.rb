# typed: false
# frozen_string_literal: true

# Homebrew formula for pgtail - PostgreSQL log tailer
# Installs Nuitka-compiled standalone distribution from tar.gz archives
class Pgtail < Formula
  desc "Interactive PostgreSQL log tailer with auto-detection and color output"
  homepage "https://github.com/willibrandon/pgtail"
  license "MIT"
  version "0.2.4"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-arm64.tar.gz"
      sha256 "7d55f08472ed663c37de731d358e361417e3c8351894e3456c3b08cac035d8ef"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64.tar.gz"
      sha256 "4a35245a0a2950e35112e9f6e839301871ce52e7a55bd1d770ee27b5d9748960"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64.tar.gz"
      sha256 "58cc260bb98262089309865fedb1ac2dab25fa6a497daff4681386bd916cace5"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64.tar.gz"
      sha256 "2d6850c9a68ea3cc8bce7b082dd7c4e2895ef1a5c8a3d12280078b99c4c053e2"
    end
  end

  def install
    # Homebrew extracts tar.gz and enters the top-level folder automatically
    # Files are at the current directory, not in a subfolder
    libexec.install Dir["*"]
    bin.install_symlink libexec/"pgtail"
  end

  test do
    # Verify the binary runs and outputs the correct version
    assert_match version.to_s, shell_output("#{bin}/pgtail --version")
  end
end
