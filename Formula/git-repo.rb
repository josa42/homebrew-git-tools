class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.7.1"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/v#{version}.tar.gz"
  sha256 "2e8f0abdfad13ab09e016f1b1180439dad538ee20b86ba948444dccf735ba0fd"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-repo"
  end

  test do
    system bin/"git-repo", "--help"
  end
end
