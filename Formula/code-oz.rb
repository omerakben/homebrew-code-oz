# typed: false
# frozen_string_literal: true

# Homebrew formula for code-oz v0.20.3-alpha.0.
# Rendered from docs/homebrew/code-oz.rb.template in omerakben/code-oz at
# release time. Tap: https://github.com/omerakben/homebrew-code-oz

class CodeOz < Formula
  desc "Repo-native agentic SDLC runtime - multi-agent software-company simulation CLI"
  homepage "https://github.com/omerakben/code-oz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.3-alpha.0/code-oz-v0.20.3-alpha.0-darwin-arm64.tar.gz"
      sha256 "27f72ab42c2686a7a60a63efd06a8fa3cfe8e469ce32faf9ad649c66c15016cf"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.3-alpha.0/code-oz-v0.20.3-alpha.0-darwin-x64.tar.gz"
      sha256 "22397ac102b8c8c2e4d5f2a8f2f7322bf91e6f82693aaea0fa086aacf0e1a945"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.3-alpha.0/code-oz-v0.20.3-alpha.0-linux-arm64.tar.gz"
      sha256 "d898a93aa9b2cdb21194b09073180ba533c1aadad8b7d3a11344e72ba9ad823c"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.3-alpha.0/code-oz-v0.20.3-alpha.0-linux-x64.tar.gz"
      sha256 "8896e71e4fab383d9c7f10533aef6af8101a9d70fac5e13b419641b74db046cd"
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
