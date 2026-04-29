class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.22"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.22/vix-darwin-arm64.tar.gz"
      sha256 "5ee1b9b4457aec1480ecafa79f028360c09a1060e8e924d7ac62e1ed589c66d8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.22/vix-linux-arm64.tar.gz"
      sha256 "e105ac20c126e71444847ec8afe180ef86313e6c0ebf6b0c1b1fabf13e3e3870"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.22/vix-linux-amd64.tar.gz"
      sha256 "a38b16df844930542d79bcda6fad37fb4e9f476aec3c062524c3d5120d6cc5ea"
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
