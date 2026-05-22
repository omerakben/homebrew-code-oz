# typed: false
# frozen_string_literal: true

# Homebrew formula for code-oz v0.21.1-alpha.0.
# Rendered from docs/homebrew/code-oz.rb.template in omerakben/code-oz at
# release time. Tap: https://github.com/omerakben/homebrew-code-oz

class CodeOz < Formula
  desc "Repo-native agentic SDLC runtime - multi-agent software-company simulation CLI"
  homepage "https://github.com/omerakben/code-oz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.1-alpha.0/code-oz-v0.21.1-alpha.0-darwin-arm64.tar.gz"
      sha256 "04d4a7c2bb59c5eea2345ff4c29142dd5d8bb22780e5fc0faad07b22e9909f54"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.1-alpha.0/code-oz-v0.21.1-alpha.0-darwin-x64.tar.gz"
      sha256 "fff7d7882b824267b3f9f2af99fc3a683f32160129ec94e5632c04b83bb17ec6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.1-alpha.0/code-oz-v0.21.1-alpha.0-linux-arm64.tar.gz"
      sha256 "ef5d742774f48098e9e3061224f8afcd5520a6a4021aa17567dcb69f441d0acb"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.21.1-alpha.0/code-oz-v0.21.1-alpha.0-linux-x64.tar.gz"
      sha256 "02ba1481629741ee0166d47e73d9f7124912b51d9c106018e637126ae4c2edd4"
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
