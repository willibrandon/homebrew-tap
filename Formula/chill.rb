# typed: false
# frozen_string_literal: true

class Chill < Formula
  desc "Terminal lofi radio with background playback and an interactive REPL"
  homepage "https://github.com/willibrandon/chill"
  version "0.15.1"
  license "MIT"

  depends_on "deno"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_arm64.tar.gz"
      sha256 "8f1ebe3681796e5786e0e9af4907c4f8ab07a0c5efae1442e2cf93632323f967"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_amd64.tar.gz"
      sha256 "3fdf3b5c3c132f7f166eb93541c9537bf0238fd16ade9a8a0931137425481b97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_arm64.tar.gz"
      sha256 "42a5a4f956c2d66149b3a12eb3771b7f8c8888807e7b092d4fd31e612019f6fa"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_amd64.tar.gz"
      sha256 "16c6af2bf0dabee0dcef51909993b92dad55c786a87631704698b27b612afea0"
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
