# typed: false
# frozen_string_literal: true

class Chill < Formula
  desc "Terminal lofi radio with background playback and an interactive REPL"
  homepage "https://github.com/willibrandon/chill"
  version "0.9.0"
  license "MIT"

  depends_on "deno"
  depends_on "mpv"
  depends_on "ffmpeg"
  depends_on "yt-dlp"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_arm64.tar.gz"
      sha256 "d8900081183264c061c6c8277bf943a1dc23361da94b846c700a4ab8f58f272b"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_darwin_amd64.tar.gz"
      sha256 "3353ab10808f927728108a5b6984eea0b3b789f79c4460630c01220d35f89998"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_arm64.tar.gz"
      sha256 "3752910975b11dd223fcc2e1dbac3d3a391475236212d0fbb282568f1eac2d8a"
    end
    on_intel do
      url "https://github.com/willibrandon/chill/releases/download/v#{version}/chill_#{version}_linux_amd64.tar.gz"
      sha256 "b7dd4169e9989beb1e3babe2a7a5a678d17c97e0ef8b11f9dddf0391ca24332d"
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
