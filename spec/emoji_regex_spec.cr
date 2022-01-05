require "./spec_helper"

Spectator.describe "::RGIEmoji" do
  let(:subject) { EmojiRegex::RGIEmoji }

  it "matches ⌚️ watch (default emoji presentation character (Emoji_Presentation))" do
    expect("\u{231A}".match(subject).try(&.to_a)).to eq(["\u{231A}"])
  end

  it "matches ↔️ left-right arrow (default text presentation character rendered as emoji)" do
    expect("\u{2194}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{2194}\u{FE0F}"])
  end

  it "matches 👩 woman (emoji modifier base (Emoji_Modifier_Base))" do
    expect("\u{1F469}".match(subject).try(&.to_a)).to eq(["\u{1F469}"])
  end

  it "matches 👩🏿 woman: dark skin tone (emoji modifier base followed by a modifier)" do
    expect("\u{1F469}\u{1F3FF}".match(subject).try(&.to_a)).to eq(["\u{1F469}\u{1F3FF}"])
  end

  it "matches 👩🏾‍✈️🏿 woman pilot: medium-dark skin tone (emoji modifier base followed by a modifier, with ZWJ sequence and default text representation character)" do
    expect("\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}"])
  end

  it "matches 🧏🏻‍♀️ deaf woman: light skin tone (emoji modifier bae followed by a modifier and gender ZWJ sequence)" do
    expect("\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}"])
  end

  it "matches 🪴 potted plant" do
    expect("\u{1FAB4}".match(subject).try(&.to_a)).to eq(["\u{1FAB4}"])
  end

  it "matches 🤌🏼 pinched fingers: medium-light skin tone (emoji modifier base followed by a modifier)" do
    expect("\u{1F90C}\u{1F3FC}".match(subject).try(&.to_a)).to eq(["\u{1F90C}\u{1F3FC}"])
  end

  it "matches 💏🏿 couple kissing: dark skin tone (emoji 13.1 sequence)" do
    expect("\u{1F48F}\u{1F3FF}".match(subject).try(&.to_a)).to eq(["\u{1F48F}\u{1F3FF}"])
  end

  it "doesn't match # (default text presentation character)" do
    expect("#".match(subject).try(&.to_a)).to eq(nil)
  end

  it "doesn't match #️ (default text presentation character with emoji variation selector)" do
    expect("#\u{FE0F}".match(subject).try(&.to_a)).to eq(nil)
  end

  it "matches #️⃣ (default text presentation character with emoji variation selector and combining enclosing keycap)" do
    expect("#\u{FE0F}\u{20E3}".match(subject).try(&.to_a)).to eq(["#\u{FE0F}\u{20E3}"])
  end

  it "doesn't match non-emojis" do
    expect("abc".match(subject).try(&.to_a)).to eq(nil)
  end
end

Spectator.describe "::Regex" do
  let(:subject) { EmojiRegex::Regex }

  it "matches ⌚️ watch (default emoji presentation character (Emoji_Presentation))" do
    expect("\u{231A}".match(subject).try(&.to_a)).to eq(["\u{231A}"])
  end

  it "matches ↔️ left-right arrow (default text presentation character rendered as emoji)" do
    expect("\u{2194}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{2194}\u{FE0F}"])
  end

  it "matches 👩 woman (emoji modifier base (Emoji_Modifier_Base))" do
    expect("\u{1F469}".match(subject).try(&.to_a)).to eq(["\u{1F469}"])
  end

  it "matches 👩🏿 woman: dark skin tone (emoji modifier base followed by a modifier)" do
    expect("\u{1F469}\u{1F3FF}".match(subject).try(&.to_a)).to eq(["\u{1F469}\u{1F3FF}"])
  end

  it "matches 👩🏾‍✈️🏿 woman pilot: medium-dark skin tone (emoji modifier base followed by a modifier, with ZWJ sequence and default text representation character)" do
    expect("\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}"])
  end

  it "matches 🧏🏻‍♀️ deaf woman: light skin tone (emoji modifier bae followed by a modifier and gender ZWJ sequence)" do
    expect("\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}"])
  end

  it "matches 🪴 potted plant" do
    expect("\u{1FAB4}".match(subject).try(&.to_a)).to eq(["\u{1FAB4}"])
  end

  it "matches 🤌🏼 pinched fingers: medium-light skin tone (emoji modifier base followed by a modifier)" do
    expect("\u{1F90C}\u{1F3FC}".match(subject).try(&.to_a)).to eq(["\u{1F90C}\u{1F3FC}"])
  end

  it "matches 💏🏿 couple kissing: dark skin tone (emoji 13.1 sequence)" do
    expect("\u{1F48F}\u{1F3FF}".match(subject).try(&.to_a)).to eq(["\u{1F48F}\u{1F3FF}"])
  end

  it "doesn't match # (default text presentation character)" do
    expect("#".match(subject).try(&.to_a)).to eq(nil)
  end

  it "matches #️ (default text presentation character with emoji variation selector)" do
    expect("#\u{FE0F}".match(subject).try(&.to_a)).to eq(["#\u{FE0F}"])
  end

  it "matches #️⃣ (default text presentation character with emoji variation selector and combining enclosing keycap)" do
    expect("#\u{FE0F}\u{20E3}".match(subject).try(&.to_a)).to eq(["#\u{FE0F}\u{20E3}"])
  end

  it "doesn't match non-emojis" do
    expect("abc".match(subject).try(&.to_a)).to eq(nil)
  end
end

Spectator.describe "::Text" do
  let(:subject) { EmojiRegex::Text }

  it "matches ⌚️ watch (default emoji presentation character (Emoji_Presentation))" do
    expect("\u{231A}".match(subject).try(&.to_a)).to eq(["\u{231A}"])
  end

  it "matches ↔ left-right arrow (default text representation character)" do
    expect("\u{2194}".match(subject).try(&.to_a)).to eq(["\u{2194}"])
  end

  it "matches ↔️ left-right arrow (default text presentation character rendered as emoji)" do
    expect("\u{2194}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{2194}\u{FE0F}"])
  end

  it "matches 👩 woman (emoji modifier base (Emoji_Modifier_Base))" do
    expect("\u{1F469}".match(subject).try(&.to_a)).to eq(["\u{1F469}"])
  end

  it "matches 👩🏿 woman: dark skin tone (emoji modifier base followed by a modifier)" do
    expect("\u{1F469}\u{1F3FF}".match(subject).try(&.to_a)).to eq(["\u{1F469}\u{1F3FF}"])
  end

  it "matches 👩🏾‍✈️🏿 woman pilot: medium-dark skin tone (emoji modifier base followed by a modifier, with ZWJ sequence and default text representation character)" do
    expect("\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{1F469}\u{1F3FE}\u{200D}\u{2708}\u{FE0F}"])
  end

  it "matches 🧏🏻‍♀️ deaf woman: light skin tone (emoji modifier bae followed by a modifier and gender ZWJ sequence)" do
    expect("\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}".match(subject).try(&.to_a)).to eq(["\u{1F9CF}\u{1F3FB}\u{200D}\u{2640}\u{FE0F}"])
  end

  it "matches 🪴 potted plant" do
    expect("\u{1FAB4}".match(subject).try(&.to_a)).to eq(["\u{1FAB4}"])
  end

  it "matches 🤌🏼 pinched fingers: medium-light skin tone (emoji modifier base followed by a modifier)" do
    expect("\u{1F90C}\u{1F3FC}".match(subject).try(&.to_a)).to eq(["\u{1F90C}\u{1F3FC}"])
  end

  it "matches 💏🏿 couple kissing: dark skin tone (emoji 13.1 sequence)" do
    expect("\u{1F48F}\u{1F3FF}".match(subject).try(&.to_a)).to eq(["\u{1F48F}\u{1F3FF}"])
  end

  it "matches # (default text presentation character)" do
    expect("#".match(subject).try(&.to_a)).to eq(["#"])
  end

  it "matches #️ (default text presentation character with emoji variation selector)" do
    expect("#\u{FE0F}".match(subject).try(&.to_a)).to eq(["#\u{FE0F}"])
  end

  it "matches #️⃣ (default text presentation character with emoji variation selector and combining enclosing keycap)" do
    expect("#\u{FE0F}\u{20E3}".match(subject).try(&.to_a)).to eq(["#\u{FE0F}\u{20E3}"])
  end

  it "doesn't match non-emojis" do
    expect("abc".match(subject).try(&.to_a)).to eq(nil)
  end
end
