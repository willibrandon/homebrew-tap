# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.10/picket-v0.2.10-osx-arm64.tar.gz"
      sha256 "c98b2ce73c0dcb82023b11445573823c539218b66f3a615ea979e26d64a83add"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.10/picket-v0.2.10-osx-x64.tar.gz"
      sha256 "a78ae32489b27a767cced13663c6e64e24f44baa262449ad797a004b32c29bed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.10/picket-v0.2.10-linux-arm64.tar.gz"
      sha256 "c2bd56452229d89de2df74f087565bd47ff272f068bcb5b0bb2f88a4bc975198"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.10/picket-v0.2.10-linux-x64.tar.gz"
      sha256 "6936c339b71ac5eba5cb45dd4149038467e80c3cf5a860add3b23cae26793336"
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