class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-darwin-arm64.tar.gz"
      sha256 "c67b2d210c382bb1b233ed03bea92c2e1d39362bac061085005bc3204922170b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-linux-arm64.tar.gz"
      sha256 "07d858ca5754c582d417a281983c4f69b9e6dd045e294ef87fe4e39021a9a7de"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-linux-amd64.tar.gz"
      sha256 "dd10f22ccedcca43367709dc5a9fc7361060c3870ebe879af96e911e79397996"
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
