# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.3/picket-v0.2.3-osx-arm64.tar.gz"
      sha256 "8231d54bd8051efa8dabaaed679ab6bd99625ba63a97bbcbe9c730b8d605882e"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.3/picket-v0.2.3-osx-x64.tar.gz"
      sha256 "8ec8ce211c0c0ccccdec4e0ea5061892626d2e27efb805a9d209817a830653dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.3/picket-v0.2.3-linux-arm64.tar.gz"
      sha256 "6e5f5aa31fce30a9fa4842025cace42836b3d5f40e46e847adcb21aba4fe4098"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.3/picket-v0.2.3-linux-x64.tar.gz"
      sha256 "2ed21a66afc567a63404ec6710febf085c9e955c119ef6cfcb9c43d40e3704f9"
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