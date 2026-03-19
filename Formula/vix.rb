class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-darwin-arm64.tar.gz"
      sha256 "b829dacb09cd33c9c88328b1a339632ed4bd88aacd47d6ad0863cb33fdd7343d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-linux-arm64.tar.gz"
      sha256 "8c7f29599e36ba3320b89ab2cd1dc51c48be155174e9492f70872f167d805aed"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-linux-amd64.tar.gz"
      sha256 "0ad13da5bdf8c66d53b77f6c0ab70dfc8d7d688f8e7056d745ed5464b8e43263"
    end
  end

  def install
    bin.install "vix"
    bin.install "vix-daemon"
  end

  service do
    run [opt_bin/"vix-daemon"]
    keep_alive true
    log_path var/"log/vix-daemon.log"
    error_log_path var/"log/vix-daemon.log"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/vix --version 2>&1", 1)
  end
end
