class FishSession < Formula
  desc "UI-first session manager for fish shell"
  homepage "https://github.com/AtefR/fish-session"
  url "https://github.com/AtefR/fish-session/archive/refs/tags/v0.1.7.tar.gz"
  sha256 "d91e9d91e5d647d1e14db8a1eec038398067d5f6f947c945a0f60af0d7a87e21"

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
