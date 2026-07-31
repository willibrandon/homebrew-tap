# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.5/picket-v0.2.5-osx-arm64.tar.gz"
      sha256 "223123acd4df5ba73f831d25ddb7f529177c411c6e8aa9698621217a1741da31"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.5/picket-v0.2.5-osx-x64.tar.gz"
      sha256 "274483abd1ff82b08d10366c716a4bfe7db0938fe6285406b907ee51a6fb205f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.5/picket-v0.2.5-linux-arm64.tar.gz"
      sha256 "f205370a94037ab335625c7e8c936330f51be766fe4bf39347dfcfa0f0e97c43"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.5/picket-v0.2.5-linux-x64.tar.gz"
      sha256 "0e9ef704f6706c38266678b2a743498c5380e183cb41b100c8ba8404e0986a6c"
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