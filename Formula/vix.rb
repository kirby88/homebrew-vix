class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.1.3"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.3/vix-darwin-arm64.tar.gz"
      sha256 "626ff8cd9848286e7d6c3f6698e2029fca7d9bc9e1cbc672b72630844cd3c9b5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.3/vix-linux-arm64.tar.gz"
      sha256 "c52354bfa225bbd9c023bb2d37f8620108229d60f90e91bc926bdbc4f0c43fe7"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.1.3/vix-linux-amd64.tar.gz"
      sha256 "d2d2a9b918570c5ad7e8ab22ae2d4616b1b1c5a57692e4b211fc70201f41181f"
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
