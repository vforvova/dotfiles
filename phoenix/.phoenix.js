Phoenix.set({
  daemon: true,
  openAtLogin: true
});

let testMode = false;

// const TOP_PADDING = 40;
// const BOTTOM_PADDING = 20;
// const LEFT_PADDING = 20;
// const RIGHT_PADDING = 20;

const CMD = 'cmd';
const CTRL = 'ctrl';
const ALT = 'alt';
const MASH = [CTRL, ALT, CMD];

const keyCombo = []; // might be helpful to detect combos in the future

class Rectangle {
  constructor({ x, y, width, height }) {
    this.x = x || 0;
    this.y = y || 0;
    this.width = width || 0;
    this.height = height || 0;
  }
}

Key.on('i', MASH, () => {
  Window.focused().maximise();
});

Key.on('h', MASH, () => {
  const win = Window.focused();
  const currentScreen = win.screen();
  const currentSpace = currentScreen.currentSpace();
  const { width, height } = win.screen().flippedVisibleFrame();
  const halfWidth = width / 2;
  win.setFrame(new Rectangle({ height, width: halfWidth }));
	//currentSpace.addWindows([win]);
});

Key.on('l', MASH, () => {
  const win = Window.focused();
  const { width, height } = win.screen().flippedVisibleFrame();
  const halfWidth = width / 2;
  win.setFrame(new Rectangle({ height, x: halfWidth, width: halfWidth }));
});

Key.on('j', MASH, () => {
  const win = Window.focused();
  const { width, height } = win.screen().flippedFrame();
  const halfHeight = height / 2;
  win.setFrame(new Rectangle({ height: halfHeight, y: halfHeight, width }));
});

Key.on('k', MASH, () => {
  const win = Window.focused();
  const { width, height } = win.screen().flippedVisibleFrame();
  const halfHeight = height / 2;
  win.setFrame(new Rectangle({ height: halfHeight, width }));
});
