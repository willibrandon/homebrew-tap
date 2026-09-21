# typed: false
# frozen_string_literal: true

class Chill < Formula
  desc "Terminal lofi radio with background playback and an interactive REPL"
  homepage "https://github.com/willibrandon/chill"
  version "0.11.0"
  license "MIT"

  depends_on "deno"
  depends_on "mpv"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_arm64.tar.gz"
      sha256 "67139e5c7c5a9a7c71df6eeb96e336e9337ec993b06a0c9362f24ed97da6fd3f"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_amd64.tar.gz"
      sha256 "07e4aa37d58d28dad32d1b2ea59b8d7977a85ecea992b59d882e4a7f93fe986a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_arm64.tar.gz"
      sha256 "29be52b9d1ba6029f2cd75890dc0d1c2b78a868d7b74788f97971a645d44405e"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_amd64.tar.gz"
      sha256 "d1f75c6519183ad8cf9677984d2a5b3f471aaf2dda2080c28fb9260d0e087b09"
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
