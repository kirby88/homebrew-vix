class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.1.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.2/vix-darwin-arm64.tar.gz"
      sha256 "4d69be17346686a8c5f7c2aa9b5ab797da2cf4612c4854348864a22dfe2e0d3f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.2/vix-linux-arm64.tar.gz"
      sha256 "71b5d8ee881f22d90d48c522f1417f887bbd9f1109b8af53c34d6c12fa420872"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.1.2/vix-linux-amd64.tar.gz"
      sha256 "678c050ca55cd3f4b896676b3f217712a62b05e0f30d894e421d0fb17706923f"
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
