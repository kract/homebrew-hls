class Hls < Formula
  desc "Video converter for HLS format"
  homepage "https://github.com/kract/homebrew-hls"
  url "https://github.com/kract/homebrew-hls/archive/refs/tags/v0.0.1.tar.gz"
  sha256 "41c926fbd5950e5216bdb8709a3fd66d38aeb3405f84ce945982616802819790"
  version "0.0.1"

  depends_on "ffmpeg"

  def install
    bin.install "bin/hls"
  end

  test do
    system "#{bin}/hls", "--help"
  end
end
