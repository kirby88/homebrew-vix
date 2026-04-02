class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.5"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.5/vix-darwin-arm64.tar.gz"
      sha256 "bc2650b199e93c41cdd8eb7372b4b542b48dba15cad87f8781c7e3ea87fffe50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.5/vix-linux-arm64.tar.gz"
      sha256 "d501088d65d09c1b8c1ce83fb32f115293816c42a172bc309f06ca2d7d3de27a"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.5/vix-linux-amd64.tar.gz"
      sha256 "baf8ddc6c4fc74445ba4c419a177063922d9e0d7f65caafb08b04c55a1ec5b08"
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
