class Rrubocop < Formula
  desc "Fast RuboCop-compatible Ruby linter in Rust"
  homepage "https://github.com/adrianov/rrubocop"
  url "https://github.com/adrianov/rrubocop/archive/refs/tags/v0.7.7.tar.gz"
  sha256 "47fc34ab8f6e907f54df3d7c3f980a56d32559641b1c5d9c7c76119f1641d75d"
  license "GPL-3.0-or-later"
  head "https://github.com/adrianov/rrubocop.git", branch: "main"

  depends_on "pkgconf" => :build
  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
    man1.install "man/rrubocop.1"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/rrubocop --help")
    assert_path_exists man1/"rrubocop.1"
  end
end
