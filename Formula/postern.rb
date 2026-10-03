# typed: false
# frozen_string_literal: true

# Homebrew formula for postern - language server and checker for PostgreSQL configuration files
class Postern < Formula
  desc "Language server and checker for PostgreSQL configuration files"
  homepage "https://github.com/willibrandon/postern"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-arm64"
      sha256 "2c51011c69faa8a6bc92afe9801690036a29dc9d175163cfbdb011c12daec5df"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-x64"
      sha256 "884fc07d446f93fdc12a8ae0d75b4d7db6cbb1014e7293bed70f1b42ceadbbe8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-arm64"
      sha256 "33ace05c9085df33aa042a23815b21ae5c825ef0645799bdef36dddb58a65256"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-x64"
      sha256 "b51be6e569dc28cc4a746781eb2073163759e9428ba447363fab8eb54297fec4"
    end
  end

  def install
    bin.install Dir["postern-*"].first => "postern"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postern --version")
  end
end
