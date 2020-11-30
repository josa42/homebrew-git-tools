class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.10.1"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/v#{version}.tar.gz"
  sha256 "d1511a5c93bc93e101461ef1f2c70a40ff48cfff17bc2a6be2e40f4a4f328c1c"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-release"
  end

  test do
    system bin/"git-release", "--help"
  end
end
