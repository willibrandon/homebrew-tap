# typed: false
# frozen_string_literal: true

class Picket < Formula
  desc "Native AOT secrets scanner with Gitleaks-compatible and Picket-native modes"
  homepage "https://github.com/willibrandon/picket"
  version "0.1.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.8/picket-v0.1.8-osx-arm64.tar.gz"
      sha256 "28976f9de022847e562e7a0fdde0c924f791109f30c0ba28ae795cbaec352006"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.8/picket-v0.1.8-osx-x64.tar.gz"
      sha256 "518458e0aaeae731bc73ca6f5405b0fb97148f0368b0364f20802493ef5c0f36"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.8/picket-v0.1.8-linux-arm64.tar.gz"
      sha256 "2e9a3943cde39e194bfcc5fbbfda83e2f2b59f4279a3bdcae78b661feb4fbf05"
    end
    on_intel do
      url "https://github.com/willibrandon/picket/releases/download/v0.1.8/picket-v0.1.8-linux-x64.tar.gz"
      sha256 "1cb59c8ec59d5780e6897e04cb0dd82001fb3456dc2916048b173196c1d3ee0b"
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