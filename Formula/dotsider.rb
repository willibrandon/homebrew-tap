# typed: false
# frozen_string_literal: true

# Homebrew formula for dotsider - .NET assembly analyzer TUI
class Dotsider < Formula
  desc "A TUI for analyzing .NET assemblies"
  homepage "https://github.com/willibrandon/dotsider"
  license "MIT"
  version "0.26.1"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-arm64.tar.gz"
      sha256 "0b3b8a42e05220ee7a98a48fb3b75337eacea201c77b233c1989f913d073fe6e"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-osx-x64.tar.gz"
      sha256 "f7188b8716b31df31a5c9462c33ee0710bd689c509aba2c2636f3369fa5de135"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-arm64.tar.gz"
      sha256 "ec747de315e39c1e4d796f3878995a06b2ec4e9159cefec22e839d75cd9eef46"
    end
    on_intel do
      url "https://github.com/willibrandon/dotsider/releases/download/v#{version}/dotsider-linux-x64.tar.gz"
      sha256 "d2df06342ccd8a9a0d5f6cd91bf705134498a5e90d9744ea6633943e7c173e13"
    end
  end

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"dotsider"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/dotsider --version")
  end
end
