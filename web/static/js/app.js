'use strict';

let game = new Chess();
let statusEl = $('#status');
let fenEl = $('#fen');
let pgnEl = $('#pgn');

// Validate that a piece can be moved before moving it.
function onDragStart (source, piece, position, orientation) {
  if (game.game_over() === true ||
      (game.turn() === 'w' && piece.search(/^b/) !== -1) ||
      (game.turn() === 'b' && piece.search(/^w/) !== -1)) {
    return false;
  }
};

// Validate moves and update game status if they're valid.
function onDrop (source, target) {
  let move = game.move({
    from: source,
    to: target,
    promotion: 'q'
  });
  if (move === null) {
    return 'snapback';
  }
  updateStatus();
};

// Update the board after the piece snap for castling, pawn promotions, etc.
function onSnapEnd () {
  board.position(game.fen());
};

// Update the status of the game accordingly.
function updateStatus () {
  let status = '';
  let moveColor = 'White';
  if (game.turn() === 'b') {
    moveColor = 'Black';
  }
  if (game.in_checkmate() === true) {
    status = 'Game over, ' + moveColor + ' is in checkmate.';
  } else if (game.in_draw() === true) {
    status = 'Game over, drawn position';
  } else {
    status = moveColor + ' to move';
    if (game.in_check() === true) {
      status += ', ' + moveColor + ' is in check';
    }
  }
  statusEl.html(status);
  fenEl.html(game.fen());
  pgnEl.html(game.pgn());
};

// Configure the path of the chesspieces.
function pieceTheme (piece) {
  return 'images/' + piece + '.png';
};

let board = new ChessBoard('board', {
  draggable: true,
  position: 'start',
  onDragStart: onDragStart,
  onDrop: onDrop,
  onSnapEnd: onSnapEnd,
  pieceTheme: pieceTheme
});

updateStatus();
