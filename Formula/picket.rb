# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.10/picket-v0.1.10-osx-arm64.tar.gz"
      sha256 "97fd01c04244fd3d53e5ffde6626ff22702262c08564e25a8e4dbb2052728b16"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.10/picket-v0.1.10-osx-x64.tar.gz"
      sha256 "c20fae10dd004a56e86c4d8f888659c25c2c33b27000dbe8a1c1a9c9d9d2b787"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.10/picket-v0.1.10-linux-arm64.tar.gz"
      sha256 "54c9ef7b1e4a248444f8361cee9d8a397260f630373218c6fff481c2ca559e9b"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.10/picket-v0.1.10-linux-x64.tar.gz"
      sha256 "113a5072ecc8bc50e08763e504d1eb67631e295df9ec441beac9cdb0dab8d5a2"
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