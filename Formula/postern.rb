# typed: false
# frozen_string_literal: true

# Homebrew formula for postern - language server and checker for PostgreSQL configuration files
class Postern < Formula
  desc "Language server and checker for PostgreSQL configuration files"
  homepage "https://github.com/willibrandon/postern"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-arm64"
      sha256 "ff50d713a439fb564269a3b074b2544c2350560e40ed8ab3d6b2002433726532"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-x64"
      sha256 "17b3ad39f792fced4c060177e2903cb56464f43b18af52cb2219025694842bd8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-arm64"
      sha256 "33a782716faf988131ee7eaf13186360be9d087482e154866d0fe6c5572b4816"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-x64"
      sha256 "d6043840bbfd2d88d97fc29ba39a757b99b76ed8e953163cbc78ab0f95104bc1"
    end
  end

  def install
    bin.install Dir["postern-*"].first => "postern"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postern --version")
  end
end
