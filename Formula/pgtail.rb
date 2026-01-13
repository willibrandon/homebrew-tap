# typed: false
# frozen_string_literal: true

# Homebrew formula for pgtail - PostgreSQL log tailer
# Installs Nuitka-compiled standalone distribution from tar.gz archives
class Pgtail < Formula
  desc "Interactive PostgreSQL log tailer with auto-detection and color output"
  homepage "https://github.com/willibrandon/pgtail"
  license "MIT"
  version "0.4.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-arm64.tar.gz"
      sha256 "700769880699f15e7cb44f4d7e2a695f41854fe906344c3671083a2d1b0f717f"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64.tar.gz"
      sha256 "b9d69886831827a3106cd65e002b8e297c8a1a91aaf84c379f6036f9e865ed3a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64.tar.gz"
      sha256 "89e7b344e3a9be7603c2fe9b89f01a90c086d7cb275a8a59186a71e10276499d"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64.tar.gz"
      sha256 "56dfe096a5724134feaca2d5d147e2349c417fc43e8a191e09023988e29597fb"
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
