class GitBusFactor < Formula
  desc ""
  version "0.4.0"

  homepage "https://github.com/josa42/git-bus-factor"
  head "https://github.com/josa42/git-bus-factor.git"
  url "https://github.com/josa42/git-bus-factor/archive/v#{version}.tar.gz"
  sha256 "a5df2097cee6b97aeefd04f196d1b5e2d7a6b290f3624ecf583c54eb7d742cda"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args
  end

  test do
    system bin/"git-bus-factor", "--help"
  end
end
