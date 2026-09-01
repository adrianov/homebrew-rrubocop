class Rrubocop < Formula
  desc "Fast RuboCop-compatible Ruby linter in Rust"
  homepage "https://github.com/adrianov/rrubocop"
  url "https://github.com/adrianov/rrubocop/archive/refs/tags/v0.7.3.tar.gz"
  sha256 "03eb0c1196d7b0dfb57f7609c7f7efe022f51361027496ab34e7d31134824e00"
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
