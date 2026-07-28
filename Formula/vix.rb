class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.7"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.7/vix-darwin-arm64.tar.gz"
      sha256 "703c12e20525db3bd716f2962458cbd93c2cf5faa4b0eb18c4496ba6a92c7e44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.7/vix-linux-arm64.tar.gz"
      sha256 "3a386ce1731c1ef4b37984c1dbac7f2a5e6e3185d9e371df206395823f860946"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.7/vix-linux-amd64.tar.gz"
      sha256 "7c4500d899f7ceee7525d23628a8f50998ca2cf20e724e5d0da4d141e5fc7931"
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
