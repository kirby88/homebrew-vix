class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.12"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.12/vix-darwin-arm64.tar.gz"
      sha256 "0b22d775140f17486b904c2cf39f0ffc44650a47e5d67bbeec17d0f2fd7e1050"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.12/vix-linux-arm64.tar.gz"
      sha256 "12e14258446854d99e7f0301b50805c47d027018222a196d00b3676d12c50999"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.12/vix-linux-amd64.tar.gz"
      sha256 "67022bac76aa50557a77e3275e3ed3a1e9cb620bac4236eb80ed4439521e9bfa"
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
