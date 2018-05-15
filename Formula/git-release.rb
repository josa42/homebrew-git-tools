class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.6.2"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/#{version}.tar.gz"
  sha256 "13f7e0438069a616f3099334d3d68e10ec03a5d603ebb1bdc2078728839b9339"

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
