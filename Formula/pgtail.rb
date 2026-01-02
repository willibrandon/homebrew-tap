# typed: false
# frozen_string_literal: true

# Homebrew formula for pgtail - PostgreSQL log tailer
# Installs Nuitka-compiled standalone distribution from tar.gz archives
class Pgtail < Formula
  desc "Interactive PostgreSQL log tailer with auto-detection and color output"
  homepage "https://github.com/willibrandon/pgtail"
  license "MIT"
  version "0.2.2-rc5"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-arm64.tar.gz"
      sha256 "749d35e43b9d8e0721c827096705d8c9c934e02aeed15824ad989665ff63d7d6"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64.tar.gz"
      sha256 "5ea350138931e6cce06d576f8ee5815a34da4bf6dc359fde635d24c6f985241b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64.tar.gz"
      sha256 "890f141978532d8f0b08d77040752520feb2913026c6c7b854920ba4b88c26e5"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64.tar.gz"
      sha256 "aa67a0b4fa2c247d8e62e990a76e825b5a1a08d33bc1f72d6bdd03cff77d104e"
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
