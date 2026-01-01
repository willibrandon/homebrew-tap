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
      sha256 "91a3b1b308baad52798e5bd68ef27c6c462b843a27ceae9dcc74f58b34e10f0c"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-macos-x86_64"
      sha256 "8bc4fc4ede77e6ce717b64ef79e37f398b334a7413e6080f78c29546f18d3e1b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-arm64"
      sha256 "6b2b38dbaeb21b5a2a03ff3c0ba27ca566ed742e29e82cd438eb8f1e19978426"
    end
    on_intel do
      url "https://github.com/willibrandon/pgtail/releases/download/v#{version}/pgtail-linux-x86_64"
      sha256 "dea6e2b1913a2b8990ad9221593050854f44ec86a1f763f2c3658ae6961b7d8f"
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
