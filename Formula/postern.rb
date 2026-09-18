# typed: false
# frozen_string_literal: true

# Homebrew formula for postern - language server and checker for PostgreSQL configuration files
class Postern < Formula
  desc "Language server and checker for PostgreSQL configuration files"
  homepage "https://github.com/willibrandon/postern"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-arm64"
      sha256 "c95be1f388727db5f8190775b9f470b7abbb7acad1c065019a4155a40cd2e5d1"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-darwin-x64"
      sha256 "f888f69714e13f2fddac04b604a2343f8cb5d1a382edb6caf2a095acde14a08f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-arm64"
      sha256 "410e73d019a588969c6a43af8b4ea07e61459e1894caf7efd4cd428c5d04558c"
    end
    on_intel do
      url "https://github.com/willibrandon/postern/releases/download/v#{version}/postern-#{version}-linux-x64"
      sha256 "1ec13802649bd4f7a10b1738dd998f1aaf354e3c6889e1cf3f89d26e537f7566"
    end
  end

  def install
    bin.install Dir["postern-*"].first => "postern"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/postern --version")
  end
end
