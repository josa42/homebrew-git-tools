class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.5.3"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "7b301499345848701c42088a74c68f03676d4b37963e3252ffce867b03a67ab1"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath

    dir = buildpath/"src/github.com/josa42/git-repo"
    dir.install Dir["*"]
    cd dir do
      system "go", "build", "-o", bin/"git-repo"
    end
  end

  test do
    system bin/"git-repo", "--help"
  end
end
