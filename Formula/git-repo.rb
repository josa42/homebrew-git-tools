class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.1.0"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "bd6a0c6a87179711970c8c3db356e9821dc5f87e867fd5b6dea0ce7dec7dc874"

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
