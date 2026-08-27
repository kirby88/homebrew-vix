class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/get-vix/vix"
  version "0.5.8"
  license "AGPL-3.0-or-later"

  on_macos do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.8/vix-darwin-arm64.tar.gz"
      sha256 "8132743a597f1132ca01717efebe513593d4d985d546a7dd2b25b5c8064c0ca6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/get-vix/vix/releases/download/v0.5.8/vix-linux-arm64.tar.gz"
      sha256 "f042bbca6141b4358f17106d9b8cbd4dc7f1662d6df0ad1eaebe18e3380aec10"
    end
    on_intel do
      url "https://github.com/get-vix/vix/releases/download/v0.5.8/vix-linux-amd64.tar.gz"
      sha256 "d39a8c7a21293b8cb01dac3ad65f99b9867e994a84fb108f81991c5a857001ef"
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
