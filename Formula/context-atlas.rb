class ContextAtlas < Formula
  desc "Read-only atlas of every place your coding agents run and what they load there"
  homepage "https://github.com/bitcomplete/context-atlas"
  # A release asset on this tap, not a clone of the source repo. context-atlas is private, so a
  # clone requires repo access and the tap would be installable only by people who already have
  # it. kploy solves the same problem the same way.
  url "https://github.com/bitcomplete/homebrew-tap/releases/download/v1.1.0-context-atlas/context-atlas-1.1.0.tar.gz"
  sha256 "bf67e8bcfcdbc54b932bbfc6e649edff2bc5338e3739506003b278be52b6ac88"
  version "1.1.0"
  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"context-atlas").write <<~EOS
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/src/cli.js" "$@"
    EOS
  end

  service do
    run [opt_bin/"context-atlas"]
    keep_alive true
    log_path var/"log/context-atlas.log"
    error_log_path var/"log/context-atlas.log"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/context-atlas --version").strip
  end
end
