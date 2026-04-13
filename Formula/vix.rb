class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.10"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.10/vix-darwin-arm64.tar.gz"
      sha256 "e467a80466d17dc7be2e8228e54fe0a59e14322cebf884620b5e518283b08eaf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.10/vix-linux-arm64.tar.gz"
      sha256 "22076e84567cbc211bef7e2aa7c14c0c27bdb43dfc368fc44b1cfd130bb1d728"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.10/vix-linux-amd64.tar.gz"
      sha256 "03cb8f8c69426732d3e6e8f1d9bfda43cdbbe402063027254b89302d73f61af3"
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
