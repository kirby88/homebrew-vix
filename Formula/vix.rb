class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/julien/vix-releases"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/julien/vix-releases/releases/download/v0.1.0/vix-darwin-arm64.tar.gz"
      sha256 "f3a57ac9097b0a19ee23b09ef76913a4ce14fd57f5136fb11f29fe7f68d27bf6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/julien/vix-releases/releases/download/v0.1.0/vix-linux-arm64.tar.gz"
      sha256 "ee4c2ea1c7f4a0d15a136e9f7ca6e2863a8cc17bb865c026303f7253455cbac7"
    end
    on_intel do
      url "https://github.com/julien/vix-releases/releases/download/v0.1.0/vix-linux-amd64.tar.gz"
      sha256 "b5eeb1aa69822d3947ab8ba2534bba5de66324175c33255c03b96d641fb0c18c"
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
