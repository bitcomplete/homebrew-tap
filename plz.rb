require "formula"

class Plz < Formula
    desc "plz CLI"
    homepage "https://plz.review"
    version "0.1.0"
    url "https://github.com/bitcomplete/plz-cli/releases/download/0.1.0/plz-darwin-amd64-0.1.0.tar.gz"
    sha256 "b06449fd78c62f6dbf9b9d5c132cbfcd3cf2e4d7180cb01d8125415295eb3e31"

    bottle :unneeded
  
    def install
      bin.install "plz"
    end
  
    test do
      system "#{bin}/plz", "--version"
    end
end
