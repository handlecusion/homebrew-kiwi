class Kiwiki < Formula
  desc "Local-first, agent-operated knowledge wiki framework"
  homepage "https://github.com/handlecusion/kiwiki"
  # bump tag+version on each release (scripts/release-bump.sh <version>)
  url "https://github.com/handlecusion/kiwiki.git", using: :git, tag: "v0.3.2"
  version "0.3.2"

  depends_on "python@3.13"

  def install
    python3 = Formula["python@3.13"].opt_bin/"python3.13"
    system python3, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--no-cache-dir", ".[mcp,menubar]"
    bin.install_symlink libexec/"bin/kiwiki"
  end

  test do
    assert_match "kiwiki", shell_output("#{bin}/kiwiki --version")
  end
end
