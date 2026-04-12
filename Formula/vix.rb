class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.9"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.9/vix-darwin-arm64.tar.gz"
      sha256 "76a367e43dc9fc4df406813445ab484b59264bd166924518e45afe2873ff1bd7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.9/vix-linux-arm64.tar.gz"
      sha256 "96df340d2526f091aee0be019142316246edec1d98021cec3b10c025666aa28f"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.9/vix-linux-amd64.tar.gz"
      sha256 "5771a814b9345171fe04bb9cf0f30fb86ba71b483f808801a8811dbb39604457"
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
