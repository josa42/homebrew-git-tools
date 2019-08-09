class GitBusFactor < Formula
  desc ""
  version "0.3.0"

  homepage "https://github.com/josa42/git-bus-factor"
  head "https://github.com/josa42/git-bus-factor.git"
  url "https://github.com/josa42/git-bus-factor/archive/#{version}.tar.gz"
  sha256 "272b7c2c7990564bf3bb4d4951834d9558773af1f4d9f73c1191ba49dd9f5f50"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-bus-factor"
  end

  test do
    system bin/"git-bus-factor", "--help"
  end
end
