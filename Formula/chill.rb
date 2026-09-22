# typed: false
# frozen_string_literal: true

class Chill < Formula
  desc "Terminal lofi radio with background playback and an interactive REPL"
  homepage "https://github.com/willibrandon/chill"
  version "0.14.1"
  license "MIT"

  depends_on "deno"
  depends_on "mpv"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_arm64.tar.gz"
      sha256 "2aa311012bf340bdaaa246428237cf25e428a2d7f6fa6106e31da89540a3a03f"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_amd64.tar.gz"
      sha256 "1ca2fd472e717837d8e8fae6b717a116ebcaf7b8243f1b76535cd1e065707397"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_arm64.tar.gz"
      sha256 "d76e964cbf4dcf7a076560c4a70ad9b3ff2b0870fca8b5ab7a470a16ea4401cc"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_amd64.tar.gz"
      sha256 "cf19b2b327612c53d02e4e2194d206a8259e624d3b71e5d867c16f2dbcc51376"
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
