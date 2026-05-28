class Fungible < Formula
  desc "Terminal personal finance manager with Plaid sync and AI categorization"
  homepage "https://github.com/tomfunk/fungible"
  url "https://github.com/tomfunk/fungible/archive/refs/tags/v1.2.1.tar.gz"
  sha256 "8be144c02eb4e487ee68d083a103471e4f0670a9a0b6bc7a0a5aa6555ab75dbe"
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
