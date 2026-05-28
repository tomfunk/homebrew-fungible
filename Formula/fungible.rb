class Fungible < Formula
  desc "Terminal personal finance manager with Plaid sync and AI categorization"
  homepage "https://github.com/tomfunk/fungible"
  url "https://github.com/tomfunk/fungible/archive/refs/tags/v1.2.2.tar.gz"
  sha256 "bcb18a1a71fa5c9a6d357b56eda75ab93cb859c4ceac1b1d654a1de043501dc8"
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
