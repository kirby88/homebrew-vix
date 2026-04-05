class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.6"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-darwin-arm64.tar.gz"
      sha256 "0268b8812f179c6b9e939473ff1655a15a89e9b1d1b60f4c4c77e8bfb16be3e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-linux-arm64.tar.gz"
      sha256 "a0948d5505e4628b0cfcc307f28fdb58ae4b2f6e8b90851b804cf086b1667d26"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.6/vix-linux-amd64.tar.gz"
      sha256 "1fd1784cb0e4de4dd6cbdbaf695dcb092a1b21c3dd70e7dfecd093f6f769893f"
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
