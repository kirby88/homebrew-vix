class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.1.4"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.4/vix-darwin-arm64.tar.gz"
      sha256 "5701eb26bffab0d7c9f93044971ed356a03673cd0dddfcb2bf4bec753eba1e3b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.4/vix-linux-arm64.tar.gz"
      sha256 "4464accdb5d58f153d4d77ad91a717e0e7ca8d9136c061d305a67b5702a59c49"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.1.4/vix-linux-amd64.tar.gz"
      sha256 "a91675782691a1bf6d309f0abc689e0b89e27c51d995b621e5187584d20b117f"
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
