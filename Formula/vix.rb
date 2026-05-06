class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.2.1"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.1/vix-darwin-arm64.tar.gz"
      sha256 "69497b1f3f79943e0f085361b167145696b731ca12669d129bb41b31860356e9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.1/vix-linux-arm64.tar.gz"
      sha256 "3f33a8abb75ee553bf3a9f783ab35d53a37bd7e6b56d22480fc45262beb9903d"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.1/vix-linux-amd64.tar.gz"
      sha256 "f2a0c32c9041bf56022320cd53c223f6dcf6eddf30af2da92a03d33942c66704"
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
