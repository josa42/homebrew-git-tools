class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.8.0"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/#{version}.tar.gz"
  sha256 "834466fa8a7c0fd455f58ce247c847610711a976525cccf1b4ff554d108bb51c"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-release"
  end

  test do
    system bin/"git-release", "--help"
  end
end
