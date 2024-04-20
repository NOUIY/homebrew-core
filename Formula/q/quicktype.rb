require "language/node"

class Quicktype < Formula
  desc "Generate types and converters from JSON, Schema, and GraphQL"
  homepage "https://github.com/quicktype/quicktype"
  url "https://registry.npmjs.org/quicktype/-/quicktype-23.0.149.tgz"
  sha256 "c659f135dc8159c22a985e2ca8c77629bcffd9aa784dc45d190120dfb5864ffb"
  license "Apache-2.0"
  head "https://github.com/quicktype/quicktype.git", branch: "master"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sonoma:   "5946379134fa8e9acbf252958c2e295360767ddbe924664b01ecfc2bac481a1a"
    sha256 cellar: :any_skip_relocation, arm64_ventura:  "5946379134fa8e9acbf252958c2e295360767ddbe924664b01ecfc2bac481a1a"
    sha256 cellar: :any_skip_relocation, arm64_monterey: "5946379134fa8e9acbf252958c2e295360767ddbe924664b01ecfc2bac481a1a"
    sha256 cellar: :any_skip_relocation, sonoma:         "505335d041d2310c3c64fe25b1aa0441edcca9cb54da42d11fd49a87c6e57128"
    sha256 cellar: :any_skip_relocation, ventura:        "505335d041d2310c3c64fe25b1aa0441edcca9cb54da42d11fd49a87c6e57128"
    sha256 cellar: :any_skip_relocation, monterey:       "505335d041d2310c3c64fe25b1aa0441edcca9cb54da42d11fd49a87c6e57128"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "5946379134fa8e9acbf252958c2e295360767ddbe924664b01ecfc2bac481a1a"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"sample.json").write <<~EOS
      {
        "i": [0, 1],
        "s": "quicktype"
      }
    EOS
    output = shell_output("#{bin}/quicktype --lang typescript --src sample.json")
    assert_match "i: number[];", output
    assert_match "s: string;", output
  end
end
