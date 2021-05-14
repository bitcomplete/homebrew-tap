require "formula"

class Plz < Formula
    desc "plz CLI"
    homepage "http://bitcomplete.io"
    url "https://github.com/bitcomplete/homebrew-tap/releases/download/v0.0.2/plz-0.0.2.tar.gz"
    sha256 "08e2cf7f60bee9e71ef7c0ca058198c8fe05d5b73849918474b30ce46014b56f"

    bottle :unneeded
  
    def install
      bin.install "plz"
    end
  
    test do
      # TODO ch4765 replace by `plz version`
      system "#{bin}/plz", "--help"
    end
  end
