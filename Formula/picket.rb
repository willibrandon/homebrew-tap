# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.7/picket-v0.2.7-osx-arm64.tar.gz"
      sha256 "21780c0277ba990f206a6b734089be6b294298d70973df728e66dfc32fc85256"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.7/picket-v0.2.7-osx-x64.tar.gz"
      sha256 "007cd3c91fba420ae50522012f0f6837a4a859cd4a11467678b83399f989b005"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.7/picket-v0.2.7-linux-arm64.tar.gz"
      sha256 "4ab3ab72c104c285088322b16f5c3964d58b104d5ad26a4260ff83ebd963f21c"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.7/picket-v0.2.7-linux-x64.tar.gz"
      sha256 "a9fd6e9e3e5f89d99568fbd4f9acccf69796767ed7334c52fed7d694c7834fe7"
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