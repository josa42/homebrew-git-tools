class GitCleanup < Formula
  desc ""
  # version "0.1.0"

  homepage "https://github.com/josa42/git-cleanup"
  head "https://github.com/josa42/git-cleanup.git"
  # url "https://github.com/josa42/git-cleanup/archive/#{version}.tar.gz"
  # sha256 ""

  depends_on "go" => :build
  depends_on "glide" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GLIDE_HOME"] = HOMEBREW_CACHE/"glide_home/#{name}"

    dir = buildpath/"src/github.com/josa42/git-cleanup"
    dir.install Dir["*"]
    cd dir do
      system "glide", "install"
      system "go", "build", "-o", bin/"git-cleanup"
    end
  end

  test do
    system bin/"git-cleanup", "--help"
  end
end
