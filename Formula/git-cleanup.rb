class GitCleanup < Formula
  desc ""
  version "0.3.1"

  homepage "https://github.com/josa42/git-cleanup"
  head "https://github.com/josa42/git-cleanup.git"
  url "https://github.com/josa42/git-cleanup/archive/v#{version}.tar.gz"
  sha256 "bce29bc5ce3581a825d1e9db85909b465f785782a93f3b832700fe397f104fa8"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"git-cleanup", "--help"
  end
end
