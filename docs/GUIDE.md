# darth guide

A tour of the panel, top to bottom, plus a few things to try.

## Live

Pick the deck live input goes to (A or B), the **In** device (BlackHole 2ch) and the **Out** device, then press **Use input**. The dot turns green when audio is flowing. If it stays silent, check that your Mac's output is set to BlackHole and that darth has microphone access (System Settings › Privacy & Security › Microphone).

## Decks and mixer

Each channel strip runs top to bottom:

- **Hi / Mid / Low.** An isolator, not a gentle EQ: turning a band all the way down removes it. **Kill** drops it instantly; tap a kill on the beat for a classic "bass drop".
- **Filter.** Left of centre is low-pass (darker), right is high-pass (thinner), and the centre is off.
- **Trim and fader.** Trim sets the input level, and the fader is the mix.

The **crossfader** blends A and B. **Smooth** is for long blends; **Cut** snaps fully open near the edges for scratch-style cuts. Double-click it to centre.

## Beat FX

Echo, reverb and flanger on a send. **FX On** (<kbd>F</kbd>) engages it, and **Tap** (<kbd>T</kbd>) sets the tempo: tap four or more times on the beat, and the button shows the BPM.

## Punch-in FX

Hold a pad (or keys <kbd>1</kbd>–<kbd>0</kbd>) and the effect lasts while you hold it. Hold <kbd>Shift</kbd> as well for the pad's alternate.

| Pad | Effect | Shift |
| --- | --- | --- |
| 1 | Loop 1 beat | |
| 2 | Loop 1/4 | |
| 3 | Loop 1/6 (triplet feel) | |
| 4 | Loop 1/8 | Loop 1/16 |
| 5 | Stutter | Stutter in triplets |
| 6 | Reverse | |
| 7 | Scratch | Fast scratch |
| 8 | Tape stop | Octave down |
| 9 | Low-pass sweep | High-pass sweep |
| 0 | Duck (sidechain pump) | |

Loops lock to the tap tempo, so tap first.

**Smash** is a master compressor. Turn it on, then raise the knob for anything from glue to full crush.

## keinedelay

A tape delay that sits after the punch FX.

- **FX** is the wet level. **Wet** mutes the dry signal while the delay is engaged.
- **Feedback** is how long the echoes last. In Analog mode, above about 92% the knob reads **SELF-OSC**: the echoes stop decaying and build on their own.
- **Time** is the delay length. Moving it while echoes are ringing bends their pitch, like a tape machine.
- **Speed** sets the tape speed in Analog mode, for wow and flutter.
- **Range.** **Fast** (1–50 ms) is for flanging, metallic and comb sounds. **Full** goes up to 3.2 s.
- **Mode.** **Digital** is clean. **Analog** adds saturation, wow, flutter and optional **Noise** (hiss).
- Buttons: **Punch** (hold <kbd>K</kbd>) for momentary throws, **On** (<kbd>L</kbd>) to latch, **Tap** (<kbd>Y</kbd>) to sync the time, and **Loop** (<kbd>U</kbd>), a 12 s looper (press once to record, again to play, again to clear).

### Tricks

- **Dub throw.** Set Feedback to about 60% and Full range, then tap <kbd>K</kbd> on the last word of a vocal line.
- **Howl.** In Analog mode, push Feedback to SELF-OSC, then sweep Time slowly. Pull Feedback back (or double-click it) to tame it.
- **Robot voice.** Use Fast range with Time near the bottom and Feedback at about 80%.
- **Freeze.** Latch on, max out Feedback, and kill the lows on the deck. The tail carries on by itself while you mix.

## Safety

Everything ends in a limiter, so even self-oscillation won't clip. It can still get loud, though: keep the volume sensible on headphones.
