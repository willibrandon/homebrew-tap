# typed: false
# frozen_string_literal: true

# Homebrew formula for Scout - ripgrep-compatible .NET Native AOT search
class Scout < Formula
  desc "Feature-complete port of ripgrep to .NET Native AOT"
  homepage "https://github.com/willibrandon/scout"
  license "MIT"
  version "0.6.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-arm64.tar.gz"
      sha256 "ab42c1ad4ee4028bb6aee9def6382dbb465a23430b7ffaf340bf19a57613b585"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-x64.tar.gz"
      sha256 "7e67e54cb8fa902484fd678762cdab64284f35563e7ae42c423080b9fe50e667"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-arm64.tar.gz"
      sha256 "60572931076ea68565839669fe7b7c06a8deec732d757ee136c31f008a7f2a6b"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-x64.tar.gz"
      sha256 "35477088d33c55a52cdd68e41d364ca11cda9c7c3b624354c4908d620c7636d9"
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
