require "formula"

class Plz < Formula
    desc "plz CLI"
    homepage "http://bitcomplete.io"
    url "https://github.com/bitcomplete/homebrew-tap/releases/download/v0.0.1/plz-0.0.1.tar.gz"
    sha256 "0b50af653b763c9fdb071c3ae1eb9b44b59564c40dbccf2190b0a65928cc060b"

    bottle :unneeded
  
    def install
      bin.install "plz"
    end
  
    test do
      # TODO ch4765 replace by `plz version`
      system "#{bin}/plz", "--help"
    end
  end
