# typed: false
# frozen_string_literal: true

# Homebrew formula for code-oz v0.20.2-alpha.0.
# Rendered from docs/homebrew/code-oz.rb.template in omerakben/code-oz at
# release time. Tap: https://github.com/omerakben/homebrew-code-oz

class CodeOz < Formula
  desc "Repo-native agentic SDLC runtime - multi-agent software-company simulation CLI"
  homepage "https://github.com/omerakben/code-oz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.2-alpha.0/code-oz-v0.20.2-alpha.0-darwin-arm64.tar.gz"
      sha256 "cb9a98972fb6834cf1583c633e68b21990880b885b7e560804b592ae87f828a8"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.2-alpha.0/code-oz-v0.20.2-alpha.0-darwin-x64.tar.gz"
      sha256 "b9fc6e6886190224df3661160b02833b25107177893c2207df7f03f0ae7567d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.2-alpha.0/code-oz-v0.20.2-alpha.0-linux-arm64.tar.gz"
      sha256 "9a1148bec1e6764ce23e2e588e39d6739ecb9f6a91a31b8050fc60801e795246"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.2-alpha.0/code-oz-v0.20.2-alpha.0-linux-x64.tar.gz"
      sha256 "ce8e79e55d4ba7ad943e61b09158380564dccf957cab82b742762845a3c1fe0c"
    end
  end

  def install
    bin.install "code-oz"
  end

  test do
    # Exercise `code-oz init` in Homebrew's per-test temp dir. Verifies the
    # binary boots, parses flags, and writes the expected init artifacts -
    # a stronger smoke than `code-oz --version` alone.
    system "#{bin}/code-oz", "init"
    assert_predicate testpath/".code-oz", :directory?
  end
end
