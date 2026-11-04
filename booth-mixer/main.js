const { app, BrowserWindow, session, systemPreferences, shell } = require('electron');

// let the mixer start audio without a click
app.commandLine.appendSwitch('autoplay-policy', 'no-user-gesture-required');

function createWindow() {
  const win = new BrowserWindow({
    width: 1280, height: 920, minWidth: 440, minHeight: 520,
    backgroundColor: '#101216', title: 'Booth Mixer',
    webPreferences: { contextIsolation: true, sandbox: true, backgroundThrottling: false }
  });
  win.loadFile('index.html');
  // open links in the real browser
  win.webContents.setWindowOpenHandler(({ url }) => {
    if (/^https?:/.test(url)) shell.openExternal(url);
    return { action: 'deny' };
  });
  win.webContents.on('will-navigate', (e, url) => {
    e.preventDefault();
    if (/^https?:/.test(url)) shell.openExternal(url);
  });
}

app.whenReady().then(async () => {
  const ok = p => p === 'media' || p === 'speaker-selection';
  session.defaultSession.setPermissionRequestHandler((wc, perm, cb) => cb(ok(perm)));
  session.defaultSession.setPermissionCheckHandler((wc, perm) => ok(perm));
  if (process.platform === 'darwin') {
    try { await systemPreferences.askForMediaAccess('microphone'); } catch (e) {}
  }
  createWindow();
  app.on('activate', () => { if (BrowserWindow.getAllWindows().length === 0) createWindow(); });
});

app.on('window-all-closed', () => app.quit());
