class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.20"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.20/vix-darwin-arm64.tar.gz"
      sha256 "1318d9a4c24ca7b29abf84400768398ed554bdf91cf7c6abc05c7f1009b93d42"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.20/vix-linux-arm64.tar.gz"
      sha256 "beea0c117b0bc7dd4eb5dabe1070e034e7dd1c4d031d5187be6196a36a730026"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.20/vix-linux-amd64.tar.gz"
      sha256 "a8905290d8189914b4f177d7f41f2c1ada5bcd5f7b6c9cdb192205cc4e3b98e1"
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
