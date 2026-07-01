# typed: false
# frozen_string_literal: true

# Homebrew formula for Scout - ripgrep-compatible .NET Native AOT search
class Scout < Formula
  desc "Feature-complete port of ripgrep to .NET Native AOT"
  homepage "https://github.com/willibrandon/scout"
  license "MIT"
  version "0.3.0"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-arm64.tar.gz"
      sha256 "3fe363d77c4e398ad850d3a4538b335c1dd058df40a1153b9daaa301913bbc81"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-osx-x64.tar.gz"
      sha256 "b4d7bb404be1054337bd0f44206a3b2a5a47fcfd437bde9e9e55b9c401538978"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-arm64.tar.gz"
      sha256 "01e9fcc36cec80150f4f1acbcdb8373a2a9800db78be99562d2335db6837df6b"
    end
    on_intel do
      url "https://github.com/willibrandon/scout/releases/download/v#{version}/scout-linux-x64.tar.gz"
      sha256 "a29fe243122a359d1eb9357639a0655e8b10ec514fd086fa9a433008e627ba55"
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
