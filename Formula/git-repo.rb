class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.7.0"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "14882d20bf3b93abf7b670af2ece44a10e5865264387d1b12b3f3842c0861122"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-repo"
  end

  test do
    system bin/"git-repo", "--help"
  end
end
