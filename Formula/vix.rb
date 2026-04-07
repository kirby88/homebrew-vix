class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-darwin-arm64.tar.gz"
      sha256 "ec3979bf13627daf59b065018120ede288f9f6d78af3eb9aff82fdd3ca3d9c03"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-linux-arm64.tar.gz"
      sha256 "f2b483cfc253726491ef6f70be68294c2869bea460e175c3c57c0652bc148424"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-linux-amd64.tar.gz"
      sha256 "74e81a971b77c9d43c91443e934ef1abcbda3e03f4c4d3518625ef7049af06f8"
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
