class GitRepo < Formula
  desc "Quickly open repo urls in the browser"
  version "0.5.4"

  homepage "https://github.com/josa42/git-repo"
  head "https://github.com/josa42/git-repo.git"
  url "https://github.com/josa42/git-repo/archive/#{version}.tar.gz"
  sha256 "c39b89f4def12701329cbfd1f90536cbd38251937dcf3d4a7d87d4aad2467cad"

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
