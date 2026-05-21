# typed: false
# frozen_string_literal: true

# Homebrew formula for code-oz v0.21.0-alpha.0.
# Rendered from docs/homebrew/code-oz.rb.template in omerakben/code-oz at
# release time. Tap: https://github.com/omerakben/homebrew-code-oz

class CodeOz < Formula
  desc "Repo-native agentic SDLC runtime - multi-agent software-company simulation CLI"
  homepage "https://github.com/omerakben/code-oz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.0-alpha.0/code-oz-v0.21.0-alpha.0-darwin-arm64.tar.gz"
      sha256 "07989ff664addcb185ad3dae71b1daa3bd0a8370d01bb0b277593beb9ef71f00"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.0-alpha.0/code-oz-v0.21.0-alpha.0-darwin-x64.tar.gz"
      sha256 "f57ac49f75cd8644f0982fba8cfa2abe84213b6e738cd1d6857694b72954b7c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.0-alpha.0/code-oz-v0.21.0-alpha.0-linux-arm64.tar.gz"
      sha256 "95e7006af8809007963994c8771beaef856c9a80f04698af38117558a3c5cab8"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.0-alpha.0/code-oz-v0.21.0-alpha.0-linux-x64.tar.gz"
      sha256 "6592e8f479f513c5057e53bca1b578e289b8904b6a0278f7ccf0fb1eb1198ed3"
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
