class Hls < Formula
  desc "Video converter for HLS format"
  homepage "https://github.com/kract/homebrew-hls"
  url "https://github.com/kract/homebrew-hls.git", branch: "main"
  version "0.0.1"

  depends_on "ffmpeg"

  def install
    bin.install "bin/hls"
  end

  test do
    system "#{bin}/hls", "--help"
  end
end
