class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.20"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.20/vix-darwin-arm64.tar.gz"
      sha256 "1a6c3fa389696fab919f26f074a806f2333565ecb5be24d7466924dbdbf851cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.20/vix-linux-arm64.tar.gz"
      sha256 "e87de01685313e34aec5b64ef2c2b98f70453972872eb55cf3651d6adfeede76"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.20/vix-linux-amd64.tar.gz"
      sha256 "dec8b63d630b4751bb190acff05d6641daaa08a758bf76df80807368dc4b2e35"
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
