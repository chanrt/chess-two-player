// return vectors
PVector getPositionVector(String position_string) {
  PVector pos = new PVector(0, 0);
  pos.x = int(position_string.charAt(0)) - 97;
  pos.y = int(position_string.charAt(1)) - 49;

  return pos;
}

PVector getClickedSquare() {
  return new PVector(floor((mouseX - left_padding) / square_length), floor((mouseY - top_padding) / square_length));
}

// return booleans
boolean playerPieceExists() {
  for (Piece piece : pieces) {
    if (piece.atPosition(click_square.x, 7 - click_square.y) && chance == piece.player && piece.isAlive) {
      moves.clear();
      piece.getMoves();
      return true;
    }
  }
  return false;
}

boolean moveExists() {
  for (PVector move : moves) {
    if (move.x == click_square.x && move.y == 7 - click_square.y) {
      return true;
    }
  }
  return false;
}

boolean onBoard() {
  return (left_padding < mouseX && mouseX < left_padding + 8 * square_length && top_padding < mouseY && mouseY < top_padding + 8 * square_length);
}

boolean isEmpty(int file, int rank) {
  if(file < 0 || file > 7) {
    return false;
  }
  if(rank < 0 || rank > 7) {
    return false;
  }
  for (Piece piece : pieces) {
    if (piece.atPosition(file, rank) && piece.isAlive) {
      return false;
    }
  }
  return true;
}

boolean hasEnemy(int file, int rank) {
  for (Piece piece : pieces) {
    if (piece.atPosition(file, rank) && chance != piece.player && piece.isAlive) {
      return true;
    }
  }
  return false;
}

boolean canMoveTo(int file, int rank) {
  return isEmpty(file, rank) || hasEnemy(file, rank);
}

// return voids
void changePerspective() {
  for (Piece piece : pieces) {
    piece.flipPosition();
  }
  chance = (chance == "white") ? "black" : "white";
}

void killEnemyIfAny() {
  for (Piece piece : pieces) {
    if (piece.atPosition(click_square.x, 7 - click_square.y) && chance != piece.player) {
      piece.kill();
    }
  }
}

void movePiece() {  
  for (Piece piece : pieces) {
    if (piece.atPosition(selected_square.x, 7 - selected_square.y)) {
      piece.moveTo(click_square.x, 7 - click_square.y);
    }
  }

  killEnemyIfAny();
}

void setupPieces() {
  pieces.add(new Piece("white", "pawn", "a2"));
  pieces.add(new Piece("white", "pawn", "b2"));
  pieces.add(new Piece("white", "pawn", "c2"));
  pieces.add(new Piece("white", "pawn", "d2"));
  pieces.add(new Piece("white", "pawn", "e2"));
  pieces.add(new Piece("white", "pawn", "f2"));
  pieces.add(new Piece("white", "pawn", "g2"));
  pieces.add(new Piece("white", "pawn", "h2"));
  pieces.add(new Piece("white", "knight", "b1"));
  pieces.add(new Piece("white", "knight", "g1"));
  pieces.add(new Piece("white", "bishop", "c1"));
  pieces.add(new Piece("white", "bishop", "f1"));
  pieces.add(new Piece("white", "rook", "a1"));
  pieces.add(new Piece("white", "rook", "h1"));
  pieces.add(new Piece("white", "queen", "d1"));
  pieces.add(new Piece("white", "king", "e1"));

  pieces.add(new Piece("black", "pawn", "a7"));
  pieces.add(new Piece("black", "pawn", "b7"));
  pieces.add(new Piece("black", "pawn", "c7"));
  pieces.add(new Piece("black", "pawn", "d7"));
  pieces.add(new Piece("black", "pawn", "e7"));
  pieces.add(new Piece("black", "pawn", "f7"));
  pieces.add(new Piece("black", "pawn", "g7"));
  pieces.add(new Piece("black", "pawn", "h7"));
  pieces.add(new Piece("black", "knight", "b8"));
  pieces.add(new Piece("black", "knight", "g8"));
  pieces.add(new Piece("black", "bishop", "c8"));
  pieces.add(new Piece("black", "bishop", "f8"));
  pieces.add(new Piece("black", "rook", "a8"));
  pieces.add(new Piece("black", "rook", "h8"));
  pieces.add(new Piece("black", "queen", "d8"));
  pieces.add(new Piece("black", "king", "e8"));
}
