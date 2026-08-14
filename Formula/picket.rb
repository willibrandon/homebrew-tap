# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.2.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.12/picket-v0.2.12-osx-arm64.tar.gz"
      sha256 "13ad40a5d58e3664e2a8953800136efc91ca6ce61f40a64f85394358246e32b1"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.12/picket-v0.2.12-osx-x64.tar.gz"
      sha256 "e9e240d69c75536e5614846c8adc094815511dd2e432b534d8350eac8458fb64"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.12/picket-v0.2.12-linux-arm64.tar.gz"
      sha256 "d0dc2bd947a4012f32da4e20a06dbdd8d82739469e73adc0edaa8514e11b6155"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.2.12/picket-v0.2.12-linux-x64.tar.gz"
      sha256 "1a2ee9dcf0ed52bc3cc262b8f3058b9d9aed887a580519aeedc8f85f9239bbde"
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