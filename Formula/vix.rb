class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.11"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.11/vix-darwin-arm64.tar.gz"
      sha256 "c199fdb83228aa22f74c83875d89469a44e165858948690bdb0340940ab2ab26"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.11/vix-linux-arm64.tar.gz"
      sha256 "4753763000a6f5c84abf2d09a699087ae7e4b71284ee831ddb54cea23b4721b2"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.11/vix-linux-amd64.tar.gz"
      sha256 "4c2760e823631c43c6014eb9920eae54de4e07980b8cd6110fca579a78add22b"
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
