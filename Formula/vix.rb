class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-darwin-arm64.tar.gz"
      sha256 "c64bd66f5e7f2df02a768c4dd1e4e178299179f05c0b11294ed5665e667f97da"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-linux-arm64.tar.gz"
      sha256 "49e054fbdfa906c50c3101b7abb0ec92edfdc1272b307f988538a87547e89d8f"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-linux-amd64.tar.gz"
      sha256 "ace11b593d4c9be517e2f688f8362bffcc776607ab4254752a5c6ce3baca9f43"
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
