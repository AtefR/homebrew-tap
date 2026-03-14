class FishSession < Formula
  desc "UI-first session manager for fish shell"
  homepage "https://github.com/AtefR/fish-session"
  url "https://github.com/AtefR/fish-session/archive/refs/tags/v0.1.8.tar.gz"
  sha256 "125e568844a6a49a21339ef5b9bc2804701e2adaaaea357f613bca6b0ef72e42"

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
