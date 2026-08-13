# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.11/picket-v0.2.11-osx-arm64.tar.gz"
      sha256 "b4cfae198506e13d36ce17efbbcc6d8c1e784299baac7963f4ac3000a735493f"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.11/picket-v0.2.11-osx-x64.tar.gz"
      sha256 "6e272760076dacd30af1710539d1725ad48b47f8457a5636998166730ac83d97"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.11/picket-v0.2.11-linux-arm64.tar.gz"
      sha256 "f27a6115fd33e16459046fb76299e2a19bb2a187c29711d9b3b1ed4574fd0638"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.11/picket-v0.2.11-linux-x64.tar.gz"
      sha256 "c1d694a56c2eb7844b0145ac31696952c7cf31198ff26b7cf50eb2a3131c3b54"
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