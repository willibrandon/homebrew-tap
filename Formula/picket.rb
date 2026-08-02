# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.8/picket-v0.2.8-osx-arm64.tar.gz"
      sha256 "8a6ada36afa6a311f53e56c381476791db21f5501c5bbd0a7bdb38e0c351f5f4"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.8/picket-v0.2.8-osx-x64.tar.gz"
      sha256 "45d6baa3e06c86fe55241c7ffe8f232b7772c169052ba5d83343597507e5969e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.8/picket-v0.2.8-linux-arm64.tar.gz"
      sha256 "e262dd6a720515ebc42088ef4a1db3c18eaa28575dc423894d70dfd3b343f66f"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.8/picket-v0.2.8-linux-x64.tar.gz"
      sha256 "3f2856ab34ac02c2ebb254e93c61521e9c62071d95b73cf990d87a5312619029"
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