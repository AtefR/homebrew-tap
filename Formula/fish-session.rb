class FishSession < Formula
  desc "UI-first session manager for fish shell"
  homepage "https://github.com/AtefR/fish-session"
  url "https://github.com/AtefR/fish-session/archive/refs/tags/v0.1.6.tar.gz"
  sha256 "563bc327b2767fbf4a0f5853fce1cf4b93203672ed4a7a2c0eb370a81f92dd1b"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    (share/"fish/vendor_functions.d").install "functions/fish_session.fish"
    (share/"fish/vendor_conf.d").install "conf.d/fish-session.fish"
  end

  test do
    assert_path_exists bin/"fish-session"
    assert_path_exists bin/"fish-sessiond"
  end
end
