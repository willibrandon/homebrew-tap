# typed: false
# frozen_string_literal: true

class Chill < Formula
  desc "Terminal lofi radio with background playback and an interactive REPL"
  homepage "https://github.com/willibrandon/chill"
  version "0.5.0"
  license "MIT"

  depends_on "deno"
  depends_on "mpv"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_arm64.tar.gz"
      sha256 "e3a5becdb2f72b47ab74c431e47b1cbedda755a3d18b06a4bda075fbdfd0b19e"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_amd64.tar.gz"
      sha256 "2ff3255864bf79027008c7f58efb76e2221ef1e924b8673d54dc351f1a1d5bb7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_arm64.tar.gz"
      sha256 "efd70b0ed69bba118f8a0472a642ed1a4e5791d39372ecde730c51880dc858bc"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_amd64.tar.gz"
      sha256 "f503fd90e52b47ad01a6ef098912ad294a3ae139f5102cfb92b284947d8a0bcb"
    end
  end

  def install
    bin.install "chill"
  end

  def caveats
    <<~EOS
      Update this installation with:
        brew upgrade willibrandon/tap/chill
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chill --version")
    assert_match "lofi-girl", shell_output("#{bin}/chill --list")
  end
end
