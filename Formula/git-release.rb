class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.7.0"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/#{version}.tar.gz"
  sha256 "b2091bf3fd6938dde3d5b3a03a4cef1d994cda63517f65bb1c4e88d5b3d6e898"

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
