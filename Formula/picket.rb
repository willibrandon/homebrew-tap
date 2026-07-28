# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.1/picket-v0.2.1-osx-arm64.tar.gz"
      sha256 "e104a3092841572db687b7935e73cf4e06c3f9997fbe5bdb9ffccf1f16308636"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.1/picket-v0.2.1-osx-x64.tar.gz"
      sha256 "d74fdfbf99de7f0dc827c5b86592c04455e28262a25aba7dcc538bc44daa3ced"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.1/picket-v0.2.1-linux-arm64.tar.gz"
      sha256 "06f462f4c58a0aed686ac2c7ef9a5973ac483c22c0ef779a99125afb1505b7e4"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.1/picket-v0.2.1-linux-x64.tar.gz"
      sha256 "0bcce97e5c4feb1dd5ec8cd8c057c049d36704a1c0ee381e8c87b8e7537928c2"
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