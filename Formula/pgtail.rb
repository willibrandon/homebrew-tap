# typed: false
# frozen_string_literal: true

# Homebrew formula for pgtail - PostgreSQL log tailer
# Installs Nuitka-compiled standalone distribution from tar.gz archives
class Pgtail < Formula
  desc "Interactive PostgreSQL log tailer with auto-detection and color output"
  homepage "https://github.com/willibrandon/pgtail"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-arm64.tar.gz"
      sha256 "0326c4a9d4f6bb9360a3412ad620b230263564d0dcbcaadd229e723badaab154"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64.tar.gz"
      sha256 "80e17ae74f5c62780ac18956ad7de84a3a82a17c3aceb63bc2f8992b5233bb8d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64.tar.gz"
      sha256 "81d386b44ef1acb4ee2fac658e603f114abb1070712be1de2b5f1afd4c4bf997"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64.tar.gz"
      sha256 "7112aacc763a9ad12425bb5cf8cc04cdb99705c16050f6370b9d0c05715c908d"
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
