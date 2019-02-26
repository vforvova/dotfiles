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
const SHIFT = 'shift';
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


Key.on('w', [CMD, CTRL], () => {
  Phoenix.log('ctrl+shift+w');

  const positioning = [
    Key.on('f', [], () => { Window.focused().maximise() }),
    Key.on('h', [], () => { setFrame(0, 0, 1/2, 1) }),
    Key.on('l', [], () => { setFrame(1/2, 0, 1/2, 1) }),
    Key.on('j', [], () => { setFrame(0, 1/2, 1, 1/2) }),
    Key.on('k', [], () => { setFrame(0, 0, 1, 1/2) }),
    Key.on('q', [], () => { setFrame(0, 0, 1/2, 1/2) }),
    Key.on('a', [], () => { setFrame(0, 1/2, 1/2, 1/2) }),
    Key.on('w', [], () => { setFrame(1/2, 0, 1/2, 1/2) }),
    Key.on('s', [], () => { setFrame(1/2, 1/2, 1/2, 1/2) }),
  ];

  setTimeout(() => { positioning.forEach(Key.off) }, 500);
});
