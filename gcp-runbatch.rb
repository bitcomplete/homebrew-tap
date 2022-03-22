# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class GcpRunbatch < Formula
  desc ""
  homepage "https://github.com/bitcomplete/gcp-runbatch"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/bitcomplete/gcp-runbatch/releases/download/v0.1.1/gcp-runbatch_0.1.1_Darwin_arm64.tar.gz"
      sha256 "ac38379c81c95c814b655716ae6fff16b7d29d148c5323667d9d8af5c1282ee5"

      def install
        bin.install "gcp-runbatch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bitcomplete/gcp-runbatch/releases/download/v0.1.1/gcp-runbatch_0.1.1_Darwin_x86_64.tar.gz"
      sha256 "5144baf90467fe2053760f811b9db897843dbaaa284e474420f1007368255ef1"

      def install
        bin.install "gcp-runbatch"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/bitcomplete/gcp-runbatch/releases/download/v0.1.1/gcp-runbatch_0.1.1_Linux_arm64.tar.gz"
      sha256 "e9be9c615cbb6bc626e6fd3e6b15a584ece3fb73d54dae088ba53a17f4efdbe8"

      def install
        bin.install "gcp-runbatch"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/bitcomplete/gcp-runbatch/releases/download/v0.1.1/gcp-runbatch_0.1.1_Linux_x86_64.tar.gz"
      sha256 "b48e940696b7da569a1a688a10c209c598a0d815534ae1169a8b15b2de3d352d"

      def install
        bin.install "gcp-runbatch"
      end
    end
  end

  test do
    system "#{bin}/gcp-runbatch --version"
  end
end
