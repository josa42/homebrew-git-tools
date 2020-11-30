class GitRelease < Formula
  desc "Quickly tag and push new versions"
  version "0.10.2"

  homepage "https://github.com/josa42/git-release"
  head "https://github.com/josa42/git-release.git"
  url "https://github.com/josa42/git-release/archive/v#{version}.tar.gz"
  sha256 "14d36634ff778e00ac94af7633f9c471912d484a64cc93cf671436e41e474a11"

  depends_on "go" => :build

  def install
    system "go", "build", "-o", bin/"git-release"
  end

  test do
    system bin/"git-release", "--help"
  end
end
