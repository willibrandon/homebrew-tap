# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.9/picket-v0.2.9-osx-arm64.tar.gz"
      sha256 "fbb2edb24aa2f0c2e972b16317c2f3438d97f3acf78f507b54d59b398db08fa5"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.9/picket-v0.2.9-osx-x64.tar.gz"
      sha256 "e550dc88a7532f4d7b55ce0ae4b091a50a2ecc0a6a39964279575c0006b954e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.9/picket-v0.2.9-linux-arm64.tar.gz"
      sha256 "559f3b8214b8e51d66ee3d97f5a3db4fbe3cc65940f6aee33019c071bd750ddf"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.9/picket-v0.2.9-linux-x64.tar.gz"
      sha256 "af7f2cd7605d36e469223007bde5a91653de50bb65af0bc95ac85b7b41c28f7a"
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