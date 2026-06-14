# typed: false
# frozen_string_literal: true

# Formula source for the omerakben/homebrew-code-oz tap. Lives in this repo so
# changes ride alongside the code that produces the release assets; the rendered
# Formula/code-oz.rb file lives in the tap repo after substitution.
#
# Render instructions live in docs/homebrew/README.md.

class CodeOz < Formula
  desc "CI-style gates for AI coding agents"
  homepage "https://github.com/omerakben/code-oz"
  license "MIT"
  # NOTE: no explicit `version "..."` line — `brew audit --strict --online`
  # flags it as redundant with the URL version. Homebrew parses the version
  # from `v0.21.2-alpha.0/` in the release URL automatically. (Verified
  # 2026-05-12 with the v0.20.0-alpha.0 render.)

  on_macos do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.2-alpha.0/code-oz-v0.21.2-alpha.0-darwin-arm64.tar.gz"
      sha256 "51053453e457311954fd519b13a7609730f887c79b3effbfc3ea9cffe6b7cb6e"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.2-alpha.0/code-oz-v0.21.2-alpha.0-darwin-x64.tar.gz"
      sha256 "c1ba20c0725ea2c42feb50bf2e77e9015bf4034367cb46ea03ea2db598d257cf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.2-alpha.0/code-oz-v0.21.2-alpha.0-linux-arm64.tar.gz"
      sha256 "4007b1a7f81e7e1519bf24d74d90437378ee42c3cd78d853ac19f45c305fc7a3"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.2-alpha.0/code-oz-v0.21.2-alpha.0-linux-x64.tar.gz"
      sha256 "efe76c2dee3d39b26204473b17c3e1ca113dfcb23a32b3d424ca0d79cb8eedc9"
    end
  end

  def install
    bin.install "code-oz"
  end

  test do
    # Exercise `code-oz init` in Homebrew's per-test temp dir. Verifies the
    # binary boots, parses flags, and writes the expected init artifacts —
    # a stronger smoke than `code-oz --version` alone.
    system bin/"code-oz", "init"
    assert_predicate testpath/".code-oz", :directory?
  end
end
