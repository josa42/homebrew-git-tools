class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.1.1"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "e6d1842a881da383a4514b72de92dc6aa6582da2fe70112e1689e6f305156bf6"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"

    dir = buildpath/"src/github.com/josa42/git-repo"
    dir.install Dir["*"]
    cd dir do
      system "glide", "install"
      system "go", "build", "-o", bin/"git-repo"
    end
  end

  test do
    system bin/"git-repo", "--help"
  end
end
