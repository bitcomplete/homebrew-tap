class ContextAtlas < Formula
  desc "Read-only atlas of every place your coding agents run and what they load there"
  homepage "https://github.com/bitcomplete/context-atlas"
  # SSH form: the repo is private, so anonymous https clones fail. Requires repo access.
  url "git@github.com:bitcomplete/context-atlas.git",
      using:  :git,
      tag:    "v1.0.0"
  version "1.0.0"
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
