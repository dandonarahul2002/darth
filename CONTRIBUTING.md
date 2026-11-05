# Contributing to darth

Thanks for helping out. darth is small on purpose, so a few ground rules keep it that way.

## Setup

```sh
npm install
npm start
```

Everything that makes sound or draws pixels is in `src/index.html`: no bundler, no framework. Edit it and reload the window (<kbd>⌘</kbd>+<kbd>R</kbd>).

## Guidelines

- **Keep it one file and dependency-free at runtime.** New effects go in `src/index.html` next to the existing ones.
- **Protect ears and speakers.** Everything must pass through the master limiter, and anything with feedback needs a saturator or a gain cap so it can't run away.
- **No clicks.** Ramp every gain or parameter change (`setTargetAtTime` / `linearRampToValueAtTime`), never jump `.value` while audio is playing.
- **Keyboard and screen reader friendly.** New controls need a label, and should use the existing `knob()` and segment helpers.
- **Test with live input.** Run a track through BlackHole and check for xruns, denormals or DC build-up, as well as for correctness.

## Pull requests

1. Branch from `main`.
2. Keep commits focused, and describe what you changed and how it sounds.
3. Run `npm run dist` to confirm the app still packages.
4. Add a line to `CHANGELOG.md` under **Unreleased**.

## Releases

Push a tag like `v1.1.0`. CI builds `Darth.dmg` on a macOS runner and attaches it to a GitHub release.
