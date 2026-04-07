class Vix < Formula
  desc "AI coding agent"
  homepage "https://github.com/kirby88/vix-releases"
  version "0.1.8"
  license :cannot_represent

  on_macos do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-darwin-arm64.tar.gz"
      sha256 "83c4534e610853e54591368416ac4f49bbce641d9a1b0983b67ebb37661f3db6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-linux-arm64.tar.gz"
      sha256 "424feba7d4c7b44e54698151fc8d11016757033d4678e2faf1d146e4911b883f"
    end
    on_intel do
      url "https://github.com/kirby88/vix-releases/releases/download/v0.1.8/vix-linux-amd64.tar.gz"
      sha256 "87765a3aae8d14637e64b18258db3aa7e79f7783e8e7235db2f9f5a2bca6a4be"
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
