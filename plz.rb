# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Plz < Formula
  desc "plz CLI"
  homepage "https://plz.review"
  version "0.1.8"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcomplete/plz-cli/releases/download/v0.1.8/plz_0.1.8_Darwin_arm64.tar.gz"
      sha256 "07c556dd693e31178adb844bd11d7ec753d75d46c88a026f16e7e675e6f2522e"

      def install
        bin.install "plz"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bitcomplete/plz-cli/releases/download/v0.1.8/plz_0.1.8_Darwin_x86_64.tar.gz"
      sha256 "64458181413291a8ea74cccb70ceb84826b817124c4659ee7875efd5ffd6a10b"

      def install
        bin.install "plz"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bitcomplete/plz-cli/releases/download/v0.1.8/plz_0.1.8_Linux_arm64.tar.gz"
      sha256 "fe2b8de6e55b63fc2da1432956b8cf0f3bdaf060c310ec12ad587f3b2e444ed2"

      def install
        bin.install "plz"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bitcomplete/plz-cli/releases/download/v0.1.8/plz_0.1.8_Linux_x86_64.tar.gz"
      sha256 "b81589ba88ab1b4650ce52ed001f96ce7fd7a30b3a2af7907d42120d70b7f1ae"

      def install
        bin.install "plz"
      end
    end
  end

  test do
    system "#{bin}/plz --version"
  end
end
