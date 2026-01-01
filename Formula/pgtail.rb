# typed: false
# frozen_string_literal: true

# Homebrew formula for pgtail - PostgreSQL log tailer
class Pgtail < Formula
  desc "Interactive PostgreSQL log tailer with auto-detection and color output"
  homepage "https://github.com/willibrandon/pgtail"
  license "MIT"
  version "0.1.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-arm64"
      sha256 "85c348189b689231c15f8bd08f41c519bb521cef392504f5ef682caebadf6976"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64"
      sha256 "891fc132ad59240cfc1a6d0f262bda34157acf8643e311fcee6bf51d238d5cc0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64"
      sha256 "9c5de4b47cd550a0a4c40dbf76e7b788bbd52930fd5c032decdd993442dcf3d9"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64"
      sha256 "4ccf4755e29c7926a4869f407203efe41628a0a8493d7e58e220156d1bd900ab"
    end
  end

  def install
    # Determine the correct binary name based on platform and architecture
    if OS.mac?
      binary_name = Hardware::CPU.arm? ? "pgtail-macos-arm64" : "pgtail-macos-x86_64"
    else
      binary_name = Hardware::CPU.arm? ? "pgtail-linux-arm64" : "pgtail-linux-x86_64"
    end

    # Install the binary and rename to 'pgtail'
    bin.install binary_name => "pgtail"
  end

  test do
    # Verify the binary runs and outputs the correct version
    assert_match version.to_s, shell_output("#{bin}/pgtail --version")
  end
end
