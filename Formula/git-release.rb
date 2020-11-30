class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.10.0"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/v#{version}.tar.gz"
  sha256 "d854405e5f0eee6a6c55d42663dbf988827815877e3e948c0c4b2bd3c91805a3"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-release"
  end

  test do
    system bin/"git-release", "--help"
  end
end
