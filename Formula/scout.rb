# typed: false
# frozen_string_literal: true

# Homebrew formula for Scout - ripgrep-compatible .NET Native AOT search
class Scout < Formula
  desc "Feature-complete port of ripgrep to .NET Native AOT"
  homepage "https://github.com/willibrandon/scout"
  license "MIT"
  version "0.4.5"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-arm64.tar.gz"
      sha256 "5762c03e0e13f5198ae7afe69595f81b3c4e3a9572078ae863970cb9d98ebd68"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-x64.tar.gz"
      sha256 "f2648e69db4260033109ac4dd5519f3c804710ddf234fabff7531c1d6b99e45c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-arm64.tar.gz"
      sha256 "9348d3d9cf2ed5895d7cfcf6a1da44148a86fca4fc5b64061f32482841c524d8"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-x64.tar.gz"
      sha256 "2c2d5fba74599bc8389edf35a730f2914ddd608affa7795814dd482e2ea09a53"
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
