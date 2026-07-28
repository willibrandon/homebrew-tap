# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.0/picket-v0.2.0-osx-arm64.tar.gz"
      sha256 "9c49b80f06d97c4a5991412c3e7fb15b3e507cfdcd898cb7c6cf9c117daf0aca"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.0/picket-v0.2.0-osx-x64.tar.gz"
      sha256 "bad2c49a4338857ea4463c2e13ad62c9f5ff97044c3506c961e10a60a965332a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.0/picket-v0.2.0-linux-arm64.tar.gz"
      sha256 "9511179ed584f8222ee40d8654e7f88ba30af44d058d40d2e043e9804f734067"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.0/picket-v0.2.0-linux-x64.tar.gz"
      sha256 "64aae3cecb35345ba8a86f33ef66165640f9c5e5aba9d0768740685b23b28f05"
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