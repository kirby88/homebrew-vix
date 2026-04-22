class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.17"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.17/vix-darwin-arm64.tar.gz"
      sha256 "de68afb131b8a2267bfe22aad3890e8de4a9b344d7005a459fc752d61bf6b51d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.17/vix-linux-arm64.tar.gz"
      sha256 "012cd02aede9769d0f940eede70ddbfc35591a7c0da611f0a415aec06705e16f"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.17/vix-linux-amd64.tar.gz"
      sha256 "3df254fc4982020e3fffbf5dc950c8aae1389d1a99c6fe8abb586d1fb5054d65"
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
