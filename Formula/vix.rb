class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.9"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.9/vix-darwin-arm64.tar.gz"
      sha256 "a69d8cdfdb3d2688425cdaf82a89fbacf2de203be73c68813fa6ff10fad9e604"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.9/vix-linux-arm64.tar.gz"
      sha256 "b534f79a2d5771fd6b8b6d1beb98a2dac1d664db1b2545c2e968f83db60f6e57"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.9/vix-linux-amd64.tar.gz"
      sha256 "5e32f53ccd78b84d31548de94eed369ef7aecf9358068b1a00a733b84ecb1d3e"
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
