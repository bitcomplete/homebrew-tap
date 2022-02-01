require "formula"

class Plz < Formula
    desc "plz CLI"
    homepage "https://plz.review"
    version "0.1.2"
    url "https://github.com/bitcomplete/plz-cli/releases/download/0.1.2/plz-darwin-amd64-0.1.2.tar.gz"
    sha256 "1638333006df2b16993205a7bbac686ca7f6b4580d22d3f4fcfe7d2ee65fd654"

    bottle :unneeded
  
    def install
      bin.install "plz"
    end
  
    test do
      system "#{bin}/plz", "--version"
    end
end
