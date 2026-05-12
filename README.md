# homebrew-code-oz

Homebrew tap for [code-oz](https://github.com/omerakben/code-oz) — a repo-native agentic SDLC runtime.

## Install

```sh
brew tap omerakben/code-oz
brew install omerakben/code-oz/code-oz
```

After install, run `code-oz --version` to confirm. See the main repo for the full CLI surface.

## How this tap works

The Formula at `Formula/code-oz.rb` declares per-arch URLs and SHA256s for the matching tarball asset on the upstream GitHub release. The tarballs are produced by `bun build --compile` in CI and SHA-pinned via `checksums.txt` published with each release. Same binary, same SHA, same `checksums.txt` source-of-truth as the curl|sh and npm install channels in the main repo.

The formula is rendered from `docs/homebrew/code-oz.rb.template` in [omerakben/code-oz](https://github.com/omerakben/code-oz) at release time. Bumping versions happens upstream; this tap is just the published surface.

## Platform support

- macOS arm64
- macOS x64
- Linux arm64
- Linux x64

Windows is deferred to a future release.

## License

MIT (matches code-oz). See [LICENSE](https://github.com/omerakben/code-oz/blob/main/LICENSE) in the main repo.
