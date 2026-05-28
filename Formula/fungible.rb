class Fungible < Formula
  desc "Terminal personal finance manager with Plaid sync and AI categorization"
  homepage "https://github.com/tomfunk/fungible"
  url "https://github.com/tomfunk/fungible/archive/refs/tags/v1.2.3.tar.gz"
  sha256 "360a357de7ec53d720d23809106ca5c4213029f04f97d99d5520ef213ca60fc7"
  license "ISC"

  depends_on "node"

  def install
    system "npm", "ci", "--omit=dev"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fungible"
  end

  def caveats
    <<~EOS
      Run `fungible --setup` on first launch to configure Plaid credentials.
      Data and config are stored in ~/.fungible/
    EOS
  end

  test do
    assert_predicate bin/"fungible", :executable?
  end
end
