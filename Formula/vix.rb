class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-darwin-arm64.tar.gz"
      sha256 "ddcf16e7a669d6faa5a24fc8dd53850bf9bd83b5406f4df9f775347850643d48"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-linux-arm64.tar.gz"
      sha256 "6ebb90f18880ed51f7eb28db637f88108f27605426e0f79eecf841be68631693"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.0/vix-linux-amd64.tar.gz"
      sha256 "8ebe0474b293ad65290dd6f065805263b10e4c0db3ca161462523c708088c1f4"
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
