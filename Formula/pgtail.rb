# typed: false
# frozen_string_literal: true

# Homebrew formula for pgtail - PostgreSQL log tailer
# Installs Nuitka-compiled standalone distribution from tar.gz archives
class Pgtail < Formula
  desc "Interactive PostgreSQL log tailer with auto-detection and color output"
  homepage "https://github.com/willibrandon/pgtail"
  license "MIT"
  version "0.5.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-arm64.tar.gz"
      sha256 "8d165d821e7cd7dac9de8cc24198875ad833ab130494d5975cb43e91c55b5522"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64.tar.gz"
      sha256 "2a282f99e927437a6a9825790119ba53a852bbeeaf0024ab84604fd657c8a486"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64.tar.gz"
      sha256 "2b452004b511c5c66fc926b32b6b687cc3f4470874ed30c8a15c58a914b7529b"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64.tar.gz"
      sha256 "b8a23d1b209734333226b059ed2406b4a46eda0144184d431f10e3f7bbcf0bd8"
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
