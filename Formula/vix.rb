class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.2.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.2/vix-darwin-arm64.tar.gz"
      sha256 "6eb8fbb13bce87929d552aafca23b2682a1fe0b8400cfbfb8ac66301b5cc132b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.2/vix-linux-arm64.tar.gz"
      sha256 "daa3fc19cf1326ccddc7f24fc4fc23464e5bdb8fda212f589c1fd0eecba4c2dd"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.2/vix-linux-amd64.tar.gz"
      sha256 "fbe58317ae032acaaa64b70f1124ffa662c0a684051942b54ab611c7ad9da482"
    end
  end

  def install
    bin.install "vix"
    bin.install "vixd"
  end

  service do
    run [opt_bin/"vixd"]
    keep_alive true
    log_path var/"log/vixd.log"
    error_log_path var/"log/vixd.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vix --version 2>&1", 1)
  end
end
