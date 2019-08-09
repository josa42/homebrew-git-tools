class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.6.0"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "90d18e2d5517ee0bfac156662d3d3f2f6be0b29f4760279c49c41983cf0a1e75"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-repo"
  end

  test do
    system bin/"git-repo", "--help"
  end
end
