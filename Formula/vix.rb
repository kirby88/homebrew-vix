class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-darwin-arm64.tar.gz"
      sha256 "aa33cf6326cdfd11165733f7c235d6cfd97aa0db502f4b68f4c174e5d69f520d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-linux-arm64.tar.gz"
      sha256 "b75c0ff62d604e7c8962e4c139d65d309e73f61bafa5b05ca601d2ab04d31ca2"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-linux-amd64.tar.gz"
      sha256 "06561b36030034c1db9dbd1806e1dc6bf50e27cc8af2be4a06aa355edfe37f00"
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
