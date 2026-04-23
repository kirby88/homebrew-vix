class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.18"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.18/vix-darwin-arm64.tar.gz"
      sha256 "e5b36b7670aa452ceb4fc9d7aad8537ec1a33dfbf715f46c0d77e01d9f8f21d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.18/vix-linux-arm64.tar.gz"
      sha256 "9b962baa90cdc9473f5d6943e8ee1af01e8f9406fbfb88d90f06aabc9323d15b"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.18/vix-linux-amd64.tar.gz"
      sha256 "e7d9b85690508fe30f36b10885446984ca14aa23acdf4d8ca79bfd061ab2c5a2"
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
