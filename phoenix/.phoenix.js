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

function setFrame(x, y, width, height, window = Window.focused()) {
  const screen = window.screen();
  const frame = screen.flippedVisibleFrame();
  window.setFrame({
    x: frame.x + (frame.width * x),
    y: frame.y + (frame.height * y),
    width: frame.width * width,
    height: frame.height * height,
  });
}

Key.on('h', MASH, () => {
  setFrame(0, 0, 1/2, 1);
});

Key.on('l', MASH, () => {
  setFrame(1/2, 0, 1/2, 1);
});

Key.on('j', MASH, () => {
  setFrame(0, 1/2, 1, 1/2);
});

Key.on('k', MASH, () => {
  setFrame(0, 0, 1, 1/2);
});

Key.on('u', MASH, () => {
  setFrame(0, 0, 1/2, 1/2);
});

Key.on('i', MASH, () => {
  setFrame(0, 1/2, 1/2, 1/2);
});

Key.on('o', MASH, () => {
  setFrame(1/2, 0, 1/2, 1/2);
});

Key.on('p', MASH, () => {
  setFrame(1/2, 1/2, 1/2, 1/2);
});
