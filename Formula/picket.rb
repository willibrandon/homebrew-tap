# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.9/picket-v0.1.9-osx-arm64.tar.gz"
      sha256 "a267bf961efc750f5f5344bae879c7b899b77657fb3c67f45304b21ab12ff7a4"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.9/picket-v0.1.9-osx-x64.tar.gz"
      sha256 "5072792205c13a011a28db87410a5efd9d55814c649cc86b45cc014974b3644e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.9/picket-v0.1.9-linux-arm64.tar.gz"
      sha256 "b5897ec2ca5a192c41c9288c032c8a73a39e739f58b701a6b405d9bdae1df19a"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.9/picket-v0.1.9-linux-x64.tar.gz"
      sha256 "41b90980ed58395e6f74b6afaa91d9ab169ae4d610917226ebfef7d2e8be43f5"
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