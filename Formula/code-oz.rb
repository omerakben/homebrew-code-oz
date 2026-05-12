# typed: false
# frozen_string_literal: true

# Homebrew formula for code-oz v0.20.0-alpha.0.
# Rendered from docs/homebrew/code-oz.rb.template in omerakben/code-oz at
# release time. Tap: https://github.com/omerakben/homebrew-code-oz

class CodeOz < Formula
  desc "Repo-native agentic SDLC runtime - multi-agent software-company simulation CLI"
  homepage "https://github.com/omerakben/code-oz"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.0-alpha.0/code-oz-v0.20.0-alpha.0-darwin-arm64.tar.gz"
      sha256 "25f441e30a67b690db6e7b2fd6db5fd748e1738e6862e0c7f61f1fa59b8c6df6"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.0-alpha.0/code-oz-v0.20.0-alpha.0-darwin-x64.tar.gz"
      sha256 "dd6178dee576b9b1932fb1c7d584487b9416676625f49bd981639ed2f99b7cdf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.0-alpha.0/code-oz-v0.20.0-alpha.0-linux-arm64.tar.gz"
      sha256 "f97e2c99403cbf26010d282a0f6351eee38f5b6e5b3dfb1fc606ad00dc9fe1b1"
    end
    on_intel do
      url "https://github.com/omerakben/code-oz/releases/download/v0.20.0-alpha.0/code-oz-v0.20.0-alpha.0-linux-x64.tar.gz"
      sha256 "2ac24d187ea08d5ee17137a4e342a35caedbc009d68e1b21343554df892e6a46"
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
