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
      sha256 "848a46beba731530b8dcfc30379b01ce15fa94af017a12f29855efaa19b7a2fd"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64"
      sha256 "2cb635f1b6d4e068c46b78820f4365eca61937b6fd26513000d3529c1c5967cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64"
      sha256 "49249e6e05ff6b6d6f6d2f6028bb41b0dbb251725ea6ddb21fe1866c1a4acb16"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64"
      sha256 "de085c263e87bfb50564df26c600dec440b2360f0353f64ba50049a6f4243736"
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
