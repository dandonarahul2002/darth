# darth

**A DJ mixer for whatever your Mac is playing.** Route Spotify (or any app) into darth and play with it live: kill the bass, sweep a filter, punch in loops and stutters, and throw it all into a tape delay that can howl.

darth is a single-file Web Audio instrument wrapped in a small Electron app for macOS.

## Features

- **Two decks + crossfader.** Each deck has a 3-band isolator (250 Hz / 3 kHz, Linkwitz–Riley-style), kill switches, a bipolar LP/HP filter, trim and fader. The crossfader has smooth and cut curves.
- **Send FX.** Echo, reverb and flanger, synced by tap tempo.
- **Punch-in FX.** Ten hold-to-play pads in the spirit of pocket groove boxes: loops (1, 1/4, 1/6, 1/8), stutter, reverse, scratch, tape stop, filter sweep and duck. Hold <kbd>Shift</kbd> for each pad's alternate.
- **Smash.** A drive-into-compressor master crush, blended with the dry signal.
- **keinedelay.** A tape delay with pitch-bending time changes, saturated feedback that self-oscillates near the top, wow/flutter and hiss in Analog mode, Fast (1–50 ms) and Full (up to 3.2 s) ranges, plus a 12-second looper.
- **Live input.** Pick any input device (e.g. BlackHole) and any output device (speakers, headphones, Bluetooth).
- A built-in safety limiter on the master, meters and a spectrum view. Light and dark themes follow the system.

## Install

Grab `Darth.dmg` from [Releases](https://github.com/dandonarahul2002/darth/releases/latest), open it and drag **Darth** into Applications.

The build is ad-hoc signed, not notarized, so the first launch is blocked by Gatekeeper. Either right-click the app › **Open**, or run:

```sh
xattr -dr com.apple.quarantine /Applications/Darth.app
```

Requires an Apple Silicon Mac running macOS 11 or later.

## Route your Mac's sound through darth

darth hears your Mac through [BlackHole](https://existential.audio/blackhole/), a free virtual audio driver.

1. `brew install blackhole-2ch` and restart (or run `sudo killall coreaudiod`).
2. Set your Mac's sound output to **BlackHole 2ch** (Control Centre › Sound).
3. In darth, set **In** to BlackHole 2ch and **Out** to your speakers or headphones, then press **Use input**.
4. Allow microphone access when asked. That's how macOS labels audio input; darth only listens to the device you pick.

Play something in Spotify: it now flows through deck A. When you're done, switch your Mac's output back to your speakers.

## Keyboard

| Key | Action |
| --- | --- |
| <kbd>Z</kbd> / <kbd>M</kbd> | Play deck A / B |
| <kbd>Q</kbd> <kbd>W</kbd> <kbd>E</kbd> | Kill high / mid / low on deck A |
| <kbd>I</kbd> <kbd>O</kbd> <kbd>P</kbd> | Kill high / mid / low on deck B |
| <kbd>F</kbd> | Beat FX on/off |
| <kbd>T</kbd> | Tap tempo |
| <kbd>1</kbd>–<kbd>0</kbd> | Hold a punch-in pad (<kbd>Shift</kbd> for its alternate) |
| <kbd>K</kbd> (hold) / <kbd>L</kbd> | keinedelay punch / latch on |
| <kbd>Y</kbd> / <kbd>U</kbd> | keinedelay tap / looper |

On any knob: drag or scroll, arrow keys to step (<kbd>Shift</kbd> for fine), <kbd>fn</kbd>+<kbd>←</kbd>/<kbd>→</kbd> (Home/End) for min/max, double-click to reset.

See [docs/GUIDE.md](docs/GUIDE.md) for a tour of each section and some tricks.

## Develop

```sh
git clone https://github.com/dandonarahul2002/darth && cd darth
npm install
npm start          # run the app
npm run build      # package, sign ad-hoc, make dist/Darth.dmg, install to /Applications
npm run dist       # same, without installing
```

All of the UI and audio code lives in [`src/index.html`](src/index.html). You can also open that file directly in Chrome to hack on it; live capture works there too, or use **Grab tab audio**.

Project layout:

```
src/index.html        the instrument: UI, Web Audio graph, AudioWorklet
src/main.js           Electron main process (window, permissions)
build/                app icon and Info.plist additions
scripts/build-mac.sh  package, sign, make the .dmg
docs/                 user guide
```

Contributions are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md).

## Credits

The punch-in pads are inspired by Teenage Engineering's Pocket Operators, OP-1, OP-Z and EP-133. keinedelay is inspired by the TEILE Elektronik Teil1 keinedelay. darth isn't affiliated with or endorsed by either company, and no code or samples from their products are used.

## License

[MIT](LICENSE) © Rahul Dandona
