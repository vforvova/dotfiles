// Phoenix.set({
//   daemon: true,
//   openAtLogin: true
// });
//
// const X_PADDING = 20;
// const Y_PADDING = 40;
//
// function modeSelection() {
//   Phoenix.notify('Mode Selection')
//   const space = Space.active();
//   const windows = space.windows();
//   const screenFrame = space.screen().visibleFrameInRectangle();
//   initializeMode1(windows, screenFrame);
// }
//
// function modifyFrame(win, x, y, h, w) {
//   win.setTopLeft({ x: x, y: y });
//   win.setSize({ width: w, height: h });
// }
//
// function initializeMode1(windows, screenFrame) {
//   const height = screenFrame.height - Y_PADDING * 2;
//   const width = screenFrame.width - X_PADDING * 2;
//   const one = Key.on('1', [], function() {
//     Phoenix.notify('Mode 1 Selected');
//     for (var i = 0, len = windows.length; i < len; i++) {
//       modifyFrame(windows[i], X_PADDING, Y_PADDING, height, width);
//     }
//     Key.off(one);
//   });
//   // const timer = Timer.after(75, function() {
//     // Key.off(one);
//   // });
// }
//
// const ctrlAltM = Key.on('m', ['ctrl', 'alt'], modeSelection);
//
// Constants.
const FULL = 0;
const LEFT = 1;
const RIGHT = 2;

// Hotkeys.
const keys = [];
const isHotkeysEnabled = false;
const isFullScreen = false;

// Key combinations.
const mash = ['ctrl', 'alt', 'cmd'];
const ctrl = ['ctrl'];
const ctrlAlt = ['ctrl', 'alt'];
const cmd = ['cmd'];
const cmdShift = ['cmd', 'shift'];
const none = [];

function alert(message, duration) {
    duration = duration || 1;

    const modal = new Modal();
    modal.message = message;
    modal.duration = duration;
    modal.show();
}

function computeNewFrameFromGrid(screen, grid) {
    const screenRect = screen.visibleFrameInRectangle();
    if (!screenRect) return;

    var unitX = screenRect.width / 2;
    var unitY = screenRect.height / 2;

    var newFrame = {
        x: screenRect.x + (grid.x * unitX),
        y: screenRect.y + (grid.y * unitY),
        width: grid.width * unitX,
        height: grid.height * unitY,
    };

    return newFrame;
}

function isAtGrid(grid) {
    var win = Window.focused();
    if (!win) {
        return;
    }

    var newFrame = computeNewFrameFromGrid(win.screen(), grid);

    if (win.topLeft().x !== newFrame.x) {
        return false;
    }

    if (win.size().width - newFrame.width > 20) {
        return false;
    }

    if (Math.abs(win.size().height - newFrame.height) > 20) {
        return false;
    }
    return true;
}

function moveToGrid(screen, grid) {
    var win = Window.focused();
    if (!win) {
        return;
    }

    var newFrame = computeNewFrameFromGrid(screen, grid);

    win.setSize({ width: newFrame.width, height: newFrame.height });
    win.setTopLeft({ x: newFrame.x, y: newFrame.y });
    win.setSize({ width: newFrame.width, height: newFrame.height });
    // win.setFrame(newFrame);
}

function move(win, newGrid, direction) {
    // Full screen.
    if (direction === FULL) {
        moveToGrid(win.screen(), newGrid);
        return;
    }

    // Move to the new location without moving screens.
    if (!isAtGrid(newGrid)) {
        moveToGrid(win.screen(), newGrid);
        return;
    }

    // Need to move screens.
    // Flip the 'x' location so that we move by screen halves.
    newGrid.x = 1 - newGrid.x;
    if (direction === LEFT) {
        moveToGrid(win.screen().next(), newGrid);
    } else {
        moveToGrid(win.screen().previous(), newGrid);
    }
}

function appLauncher(appName) {
    return function() {
        if (isHotkeysEnabled === true) {
            var app = App.launch(appName);
            app.focus();

            alert(appName);
        }
    };
}


/* Window movement */

// Maximize.
keys.push(new Key('i', mash, function() {
    var win = Window.focused();
    move(win, { x: 0, y: 0, width: 2, height: 2 }, FULL);
}));

// Left half.
keys.push(new Key('h', mash, function() {
    var win = Window.focused();
    move(win, { x: 0, y: 0, width: 1, height: 2 }, LEFT);
}));

// Right half.
keys.push(new Key('l', mash, function() {
    var win = Window.focused();
    move(win, { x: 1, y: 0, width: 1, height: 2 }, RIGHT);
}));

// Top-left.
keys.push(new Key('y', mash, function() {
    var win = Window.focused();
    move(win, { x: 0, y: 0, width: 1, height: 1 }, LEFT);
}));
keys.push(new Key('u', mash, function() {
    var win = Window.focused();
    move(win, { x: 0, y: 0, width: 1, height: 1 }, LEFT);
}));

// Top-right.
keys.push(new Key('p', mash, function() {
    var win = Window.focused();
    move(win, { x: 1, y: 0, width: 1, height: 1 }, RIGHT);
}));
keys.push(new Key('[', mash, function() {
    var win = Window.focused();
    move(win, { x: 1, y: 0, width: 1, height: 1 }, RIGHT);
}));

// Bottom-left.
keys.push(new Key('n', mash, function() {
    var win = Window.focused();
    move(win, { x: 0, y: 1, width: 1, height: 1 }, LEFT);
}));
keys.push(new Key('b', mash, function() {
    var win = Window.focused();
    move(win, { x: 0, y: 1, width: 1, height: 1 }, LEFT);
}));

// Bottom-right.
keys.push(new Key('.', mash, function() {
    var win = Window.focused();
    move(win, { x: 1, y: 1, width: 1, height: 1 }, RIGHT);
}));
keys.push(new Key('/', mash, function() {
    var win = Window.focused();
    move(win, { x: 1, y: 1, width: 1, height: 1 }, RIGHT);
}));

/* Hotkeys */

