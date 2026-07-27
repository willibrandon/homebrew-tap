# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.12/picket-v0.1.12-osx-arm64.tar.gz"
      sha256 "acbba6ae3ae75c78973f38be3897dffb7b7f2a440156fddf3a700eb000561f02"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.12/picket-v0.1.12-osx-x64.tar.gz"
      sha256 "7f7c20e79f99a6e28106301994064faecbb25c604a92d7652bfcf33019f812be"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.12/picket-v0.1.12-linux-arm64.tar.gz"
      sha256 "27e40a33b692fc0e96fea597034b93ce869bcb7bc0989f7cb04df70821fd28a2"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.12/picket-v0.1.12-linux-x64.tar.gz"
      sha256 "7785e0cf18a1ffd84124381f01129b493d6905ec65e957952102e650d7e3ba6a"
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