class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.6.3"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/#{version}.tar.gz"
  sha256 "7e807308409f69035a9677dea0e7be2c6db81a14dde3a0cd227dcc6d8899cb76"

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"

    dir = buildpath/"src/github.com/josa42/git-release"
    dir.install Dir["*"]
    cd dir do
      system "glide", "install"
      system "go", "build", "-o", bin/"git-release"
    end
  end

  test do
    system bin/"git-release", "--help"
  end
end
