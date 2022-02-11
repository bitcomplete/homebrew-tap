require "formula"

class Plz < Formula
    desc "plz CLI"
    homepage "https://plz.review"
    version "0.1.3"
    url "https://github.com/bitcomplete/plz-cli/releases/download/0.1.3/plz-darwin-amd64-0.1.3.tar.gz"
    sha256 "8e1d2fe0623cc27b3d2b76696b19595e588fdf82b4e064a4791ab7c4035bc004"

    bottle :unneeded
  
    def install
      bin.install "plz"
    end
  
    test do
      system "#{bin}/plz", "--version"
    end
end
