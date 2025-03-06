class Md2pdf < Formula
  desc "CLI utility that generates PDF from Markdown"
  homepage "https://github.com/solworktech/mdtopdf"
  url "https://github.com/solworktech/mdtopdf/archive/refs/tags/v2.2.13.tar.gz"
  sha256 "e973b25d84a233848d4c839e1f0e18b22dee23f5774a59b8789b081638bd60e0"
  license "MIT"
  head "https://github.com/solworktech/mdtopdf.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "4791b2ba497858777f98bd53c5e4d3ca87f34774797c2f88926d49a1c9f8f0d2"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "4791b2ba497858777f98bd53c5e4d3ca87f34774797c2f88926d49a1c9f8f0d2"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "4791b2ba497858777f98bd53c5e4d3ca87f34774797c2f88926d49a1c9f8f0d2"
    sha256 cellar: :any_skip_relocation, sonoma:        "0a788862de77d806bd6fb147360d3e9e6dd228805a65eb05b99e31a12002716e"
    sha256 cellar: :any_skip_relocation, ventura:       "0a788862de77d806bd6fb147360d3e9e6dd228805a65eb05b99e31a12002716e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "5e543d38d3490456b19bbecca945c9afafe7b61f7421f8c599cee8c0c0ac97a4"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w"), "./cmd/md2pdf"
  end

  test do
    (testpath/"test.md").write <<~MARKDOWN
      # Hello World
      This is a test markdown file.
    MARKDOWN

    system bin/"md2pdf", "-i", "test.md", "-o", "test.pdf"
    assert_path_exists testpath/"test.pdf"
  end
end
