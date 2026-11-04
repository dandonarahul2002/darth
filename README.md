# darth

## Booth Mixer (`booth-mixer/`)

Two-deck DJ mixer for your Mac's sound, built as an Electron app. It has:

- a 3-band isolator EQ with kills, a sweep filter, and trim and fader controls
- beat FX (echo, reverb and flanger) with tap tempo, plus a crossfader
- Teenage Engineering–style punch-in pads (loop, stutter, reverse, scratch, tape stop, sweep, duck), held with keys 1–0
- an EP-133-style "Smash" master compressor
- live input from Spotify, or any other sound, through the BlackHole 2ch loopback driver

### Build

```
brew install node blackhole-2ch   # once
bash booth-mixer/build.sh
```

`build.sh` packages the app, signs it ad-hoc, makes `Booth-Mixer.dmg` and installs it to /Applications.
