class GitBusFactor < Formula
  desc ""
  version "0.2.0"

  homepage "https://github.com/josa42/git-bus-factor"
  head "https://github.com/josa42/git-bus-factor.git"
  url "https://github.com/josa42/git-bus-factor/archive/#{version}.tar.gz"
  sha256 "3c6100b82a8914b2f4e1f69fe87f56a1819d4a35fa6345787678ceebfd570c34"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    
    dir = buildpath/"src/github.com/josa42/git-bus-factor"
    dir.install Dir["*"]
    cd dir do
      system "go", "build", "-o", bin/"git-bus-factor"
    end
  end

  test do
    system bin/"git-bus-factor", "--help"
  end
end
