class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.14"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.14/vix-darwin-arm64.tar.gz"
      sha256 "58021564a3cc6633b98d8b2c0f166ea6fca551899548a4bd823527553b13c5a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.14/vix-linux-arm64.tar.gz"
      sha256 "fb2d6a954a327171680846df843f0b94cb9e2aa32b845d6e6886e9093ff10d82"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.14/vix-linux-amd64.tar.gz"
      sha256 "47ec699533be54d3d854b687cd6b2a1062bc609f88709f8629f380018d23df67"
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
