class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.1.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.1/vix-darwin-arm64.tar.gz"
      sha256 "a5e41afb97a3f0b84e6f900fb39d2a400b08d91afff240156362a13592fe9ce0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.1/vix-linux-arm64.tar.gz"
      sha256 "ca3223befcb6afbb4c9973f0cf28fdeabaf93a4a8bf510808bc001d7ec422261"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.1.1/vix-linux-amd64.tar.gz"
      sha256 "7f0ff904e333e2769a603bb8d473c05cbb890dc605b3d714a6857790c68c1d4c"
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
