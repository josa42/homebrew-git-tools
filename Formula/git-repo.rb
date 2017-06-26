class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.5.1"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "320f81bebbb860190c0adc404fd34a20495f8f63eb1ed7293bda5bddb7b37e67"

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
