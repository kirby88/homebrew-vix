class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.19"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.19/vix-darwin-arm64.tar.gz"
      sha256 "ef51b948e5af198b328732e7ef0d05de139db74d3a9baf2101a28fc4bbb252ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.19/vix-linux-arm64.tar.gz"
      sha256 "0a5e6b8a588e6e2c3761794f95a8e89e6e2f1b0840c2b0b506f23ead206fdaad"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.19/vix-linux-amd64.tar.gz"
      sha256 "641e306c155d4abd7da90f469a933ec1e78034f88dde16d8e12e84d294e99641"
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
