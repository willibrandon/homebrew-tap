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
      sha256 "1eb4aa2584e914a54961c620f785598c05630fe8092f5598b91c8967ac371d92"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64"
      sha256 "088c53be22a917b9f00f10199fbc621026445798e3b200f894fa8fc227233115"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64"
      sha256 "8348574fe51955e5338f8ef8037afcfbc6cde69aa0eb17cda4b2d24a2724caa1"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64"
      sha256 "e91b5faa270ed793d61185e1a418eb35f156555ce29b93d30d3f3b862c06d1bd"
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
