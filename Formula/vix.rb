class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix"
  version "0.1.2"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.2/vix-darwin-arm64.tar.gz"
      sha256 "e96839b6b9685445aeaa18e620a730f8fe37c633ebe86a124bc557587ab2a167"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix/releases/download/v0.1.2/vix-linux-arm64.tar.gz"
      sha256 "8d24a461eeb02aa39359085eda2f3fcf2e94dfb654b7b02c2fbe79d2a83bcbf9"
    end
    on_intel do
      url "https://github.com/kirby88/vix/releases/download/v0.1.2/vix-linux-amd64.tar.gz"
      sha256 "ab198a4abb0b34ef9d43807f60c0a50ead330d36eec7629079dd29c4c818d41b"
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
