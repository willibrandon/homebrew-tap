# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.6/picket-v0.2.6-osx-arm64.tar.gz"
      sha256 "15cf921f3fedff3a1b43f5cb7c70879c2d352db224bb72246a030891dde1d000"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.6/picket-v0.2.6-osx-x64.tar.gz"
      sha256 "069fe83c0d824e34a482a1d24b381928871e89d39d0f067c410a580bcf17c567"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.6/picket-v0.2.6-linux-arm64.tar.gz"
      sha256 "4994dc159c6d85fdba5715a3dbefc46f8eee1858c9b933bc2d1126881e642519"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.6/picket-v0.2.6-linux-x64.tar.gz"
      sha256 "142d3e291f131405bf80321ab38c342b1a0ab6c3261e819868a730d48f9f1675"
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