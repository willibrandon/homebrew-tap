# typed: false
# frozen_string_literal: true

# Homebrew formula for Scout - ripgrep-compatible .NET Native AOT search
class Scout < Formula
  desc "Feature-complete port of ripgrep to .NET Native AOT"
  homepage "https://github.com/willibrandon/scout"
  license "MIT"
  version "0.2.3"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-arm64.tar.gz"
      sha256 "53c8a2ae3ec65dbe04864f28577c088d8ad14ee030250ecfea3f5b34523dd4f5"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-x64.tar.gz"
      sha256 "e2aa57dd1695d4d7ad3ea14d785fe6645dcd104e93604b33ec55319664deb5ac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-arm64.tar.gz"
      sha256 "4d8d930f026a500d4942e7422b7caabb847cb4d5ab6b44ddb3f53dbcb500c344"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-x64.tar.gz"
      sha256 "77768b6196a5e476d4efe87153758cb9bceda48805c5aa98b5f026586843e83e"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"scout"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/scout --version")
  end
end
