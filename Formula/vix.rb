class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-darwin-arm64.tar.gz"
      sha256 "e9467f8ee204ee9fa345acde9f83ec208232e37d0591f11b1a4a81ec9d171624"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-linux-arm64.tar.gz"
      sha256 "5819c5e1e44ac2a948d456b9ce8932791d0c6d4267238e719f0559dd3ddd96a7"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-linux-amd64.tar.gz"
      sha256 "facd3e91113ef945214a6283a0083834bba453000ad8dd629955b5dd07afbeff"
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
