class FishSession < Formula
  desc "UI-first session manager for fish shell"
  homepage "https://github.com/AtefR/fish-session"
  url "https://github.com/AtefR/fish-session/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "00c794317820cccc593f02d9d21239d0a7ba67ce0364f1ccbe2bbcc13437326e"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."

    (share/"fish/vendor_functions.d").install "functions/fish_session.fish"
    (share/"fish/vendor_conf.d").install "conf.d/fish-session.fish"
  end

  test do
    assert_predicate bin/"fish-session", :exist?
    assert_predicate bin/"fish-sessiond", :exist?
  end
end
