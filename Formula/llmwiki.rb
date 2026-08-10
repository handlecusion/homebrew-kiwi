class Llmwiki < Formula
  desc "Local-first, agent-operated knowledge wiki framework"
  homepage "https://github.com/handlecusion/llmwiki"
  # bump tag+version on each release (scripts/release-bump.sh <version>)
  url "https://github.com/handlecusion/llmwiki.git", using: :git, tag: "v0.0.3"
  version "0.0.3"

  depends_on "python@3.13"

  def install
    python3 = Formula["python@3.13"].opt_bin/"python3.13"
    system python3, "-m", "venv", libexec
    system libexec/"bin/pip", "install", "--no-cache-dir", ".[mcp,menubar]"
    bin.install_symlink libexec/"bin/llmwiki"
  end

  test do
    assert_match "llmwiki", shell_output("#{bin}/llmwiki --version")
  end
end
