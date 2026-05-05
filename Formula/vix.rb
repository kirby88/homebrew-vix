class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.2.0"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.0/vix-darwin-arm64.tar.gz"
      sha256 "ff410313eedcf0ca306f07ae56e7e2423e487bfbc668e47757878d2ac2dac70f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.0/vix-linux-arm64.tar.gz"
      sha256 "1865f581d78dc82b316e8c074cde73d7ef0502c520172fcd35f98e7f092162ce"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.2.0/vix-linux-amd64.tar.gz"
      sha256 "2cb7f69107f1de64c69f67d77314249b7d205c4659040f62722407abce8b528b"
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
