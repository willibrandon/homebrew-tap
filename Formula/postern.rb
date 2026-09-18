# typed: false
# frozen_string_literal: true

# Homebrew formula for postern - language server and checker for PostgreSQL configuration files
class Postern < Formula
  desc "Language server and checker for PostgreSQL configuration files"
  homepage "https://github.com/willibrandon/postern"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-arm64"
      sha256 "31e43e0a44b4fbcf5ae732da4d501246cad53c666d7147f8c70875a1e03c0a93"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-x64"
      sha256 "70443752bcfb068070f61bd3dcef7bbacce5f24d2c5887152721f1dde099ef66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-arm64"
      sha256 "f0d42e91a8c41e7cbe1eb9adda04a20b3fa8977b7acb70f9f77ae63fbd25d805"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-x64"
      sha256 "2b4fd0ee16cf71005f97c58bfa38f26fd2d63d5ef075d89d003c797ce13f1e24"
    end
  end

  def install
    bin.install Dir["postern-*"].first => "postern"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postern --version")
  end
end
