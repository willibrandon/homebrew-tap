# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.13/picket-v0.1.13-osx-arm64.tar.gz"
      sha256 "5700241ac4c2104df60326d2e2a7e8306d4c52a20317131ff375047b57c6e450"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.13/picket-v0.1.13-osx-x64.tar.gz"
      sha256 "06cfc60cc6c89240cb751c305bddff7980567d17f5da8c1ef321ec7453775bf2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.13/picket-v0.1.13-linux-arm64.tar.gz"
      sha256 "1426e3a77e39e7f41163bde9205adb8ca542c8f015ab829faae979171c9541f5"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.13/picket-v0.1.13-linux-x64.tar.gz"
      sha256 "663049929f7b9744917b4bd815cecfa1dd1492d5d5ba7aa6d740681b772b93ea"
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