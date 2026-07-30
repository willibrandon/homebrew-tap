# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.4/picket-v0.2.4-osx-arm64.tar.gz"
      sha256 "16e4dfdf9dfc242e25e1b7f7831c25d7ca3a96789df480aadbf7e189738567db"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.4/picket-v0.2.4-osx-x64.tar.gz"
      sha256 "3ca72df961b37254f34180ed88852e67457af445f44a3eec7586fdba34e0dc4f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.4/picket-v0.2.4-linux-arm64.tar.gz"
      sha256 "058a781f86958cadee2f666547d764e9cc8148bbf12e47bd3d64758737367d64"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.4/picket-v0.2.4-linux-x64.tar.gz"
      sha256 "098cd7177aa75e6819ad4cce6b62ff9f4814e9f0a06ae7ac541a98138fea6bff"
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