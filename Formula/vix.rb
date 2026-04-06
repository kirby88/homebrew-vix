class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.7"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.7/vix-darwin-arm64.tar.gz"
      sha256 "5ba09390593f3335ec0695137af2aeddec68ce3cb13b9eca8aea14dd708b7707"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.7/vix-linux-arm64.tar.gz"
      sha256 "b6f979fe64b0f5ff343942ddf7ff858f9eb72364a6819e6150c5543769486d58"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.7/vix-linux-amd64.tar.gz"
      sha256 "9b4c1f78d9fa7f0b9fce1681bb2eee702ee8c36f0d1d4e977076e9a56bc52ef6"
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
