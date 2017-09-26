class GitBusFactor < Formula
  desc ""
  version "0.2.0"

  homepage "https://github.com/josa42/git-bus-factor"
  head "https://github.com/josa42/git-bus-factor.git"
  url "https://github.com/josa42/git-bus-factor/archive/#{version}.tar.gz"
  sha256 "bb59dae120fa35f9387d9c88fe0227ce3da4f649ad879dd6d4c4ea49021b05ab"

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
