# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.6/picket-v0.1.6-osx-arm64.tar.gz"
      sha256 "2e1e78ebdadf41520e1cec1c18ab26d269b953c389d0c5e62f1816a5d98a3145"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.6/picket-v0.1.6-osx-x64.tar.gz"
      sha256 "8256adf8aba73d56b220c3f8e09a71d386d33047854d7bfaa45f1169735239af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.6/picket-v0.1.6-linux-arm64.tar.gz"
      sha256 "6b96293d131ed10a9df531e64a9ca0fec4426b52796e88a7136db45030b66ce6"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.6/picket-v0.1.6-linux-x64.tar.gz"
      sha256 "eb04153c3d4452b7a4ea20e2dfedd59e6edbe888363467875ff149f12d4ed27d"
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