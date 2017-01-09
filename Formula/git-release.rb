class GitRelease < Formula
  desc ""
  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  # url "https://github.com/josa42/git-release/archive/1.0.0.tar.gz"
  # sha256 ""

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
