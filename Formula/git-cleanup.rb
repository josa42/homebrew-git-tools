class GitCleanup < Formula
  desc ""
  version "0.3.0"

  homepage "https://github.com/josa42/git-cleanup"
  head "https://github.com/josa42/git-cleanup.git"
  url "https://github.com/josa42/git-cleanup/archive/#{version}.tar.gz"
  sha256 "8685b0655b87b483e3699f05c43ad58b2f3fcab7e2e987dadcf85f97775468bf"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-cleanup"
  end

  test do
    system bin/"git-cleanup", "--help"
  end
end
