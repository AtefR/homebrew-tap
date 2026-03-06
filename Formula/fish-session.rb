class FishSession < Formula
  desc "UI-first session manager for fish shell"
  homepage "https://github.com/AtefR/fish-session"
  url "https://github.com/AtefR/fish-session/archive/refs/tags/v0.1.5.tar.gz"
  sha256 "5275788c6619826c32113bd6389c67007f286d967fa30528b8e502c882f03a9c"

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
