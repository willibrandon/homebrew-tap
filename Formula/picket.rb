# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.11/picket-v0.1.11-osx-arm64.tar.gz"
      sha256 "ad3a4f60428013a27132941b9905d1411ce78020475a2b999fb9a2c84c686e14"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.11/picket-v0.1.11-osx-x64.tar.gz"
      sha256 "1ac52752d52cd3a54866f69387a671202bfb360c4bb43ea0b8606fc0d5430f98"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.11/picket-v0.1.11-linux-arm64.tar.gz"
      sha256 "c3c81d13afeb0aab956aa8d0c14b7167e7ca9f935453254491c44261198c1b7a"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.11/picket-v0.1.11-linux-x64.tar.gz"
      sha256 "2fc9b87a304469beba00dacf1ae6236ff9ce8670dba39dce2ad8380ecc2b33f6"
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