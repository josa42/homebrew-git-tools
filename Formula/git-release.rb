class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.1.0"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/#{version}.tar.gz"
  sha256 "30b00a54eba85fa76fb83e4b7f2da208cb62d4e3db3e69932c9686b88eb3d42e"

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
