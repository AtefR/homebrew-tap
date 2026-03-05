class FishSession < Formula
  desc "UI-first session manager for fish shell"
  homepage "https://github.com/AtefR/fish-session"
  url "https://github.com/AtefR/fish-session/archive/refs/tags/v0.1.4.tar.gz"
  sha256 "5b5f5e72bef88bcddbf9fbfeae36194a3217051d6a1d5ebf0f2bf0bf27c445e3"

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
