# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.7/picket-v0.1.7-osx-arm64.tar.gz"
      sha256 "9233b520bcb092f1c6e6d634a46f1bbeb3a5ba18032362c6af3b852a60e16d4f"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.7/picket-v0.1.7-osx-x64.tar.gz"
      sha256 "c471b4cf5c65328e0835ad2035b102d7a43369b7c9c357927092e9ee1f7e829d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.7/picket-v0.1.7-linux-arm64.tar.gz"
      sha256 "dca2926e6e832270a6bbe71ec38776326e7d6e54beb57bdee7046670d1bda7ae"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.7/picket-v0.1.7-linux-x64.tar.gz"
      sha256 "33adc62ec8b5cf1b426c1453b41143c62939d19588312c78c2cd47206be45a8f"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.write_exec_script libexec/"picket"
    bin.write_exec_script libexec/"picket-tui"
  end

  test do
    system "#{bin}/picket", "version"
    system "#{bin}/picket-tui", "--help"
  end
end