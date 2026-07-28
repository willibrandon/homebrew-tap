# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.2/picket-v0.2.2-osx-arm64.tar.gz"
      sha256 "3f7a0382bc5adeaffe5485f72cb92889d34d9aba6025343a17a2c913c2e24745"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.2/picket-v0.2.2-osx-x64.tar.gz"
      sha256 "0e9abe7976c1776c3eecf08f1befa32bbeb7d626bdff97306b0760754ce8e961"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.2/picket-v0.2.2-linux-arm64.tar.gz"
      sha256 "2f59e5c7cbee19921f39020e00f748c76a563a1d8af80c531bcafe20385911d0"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.2/picket-v0.2.2-linux-x64.tar.gz"
      sha256 "b54cadd1c7072f06d830ec25c19b9b507eec124ec9d338d0bac7013a5e58765e"
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