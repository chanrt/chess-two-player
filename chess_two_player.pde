import processing.sound.*;
SoundFile background_music, selected_sound, placed_sound;
boolean loadedAudio;

ArrayList<Piece> pieces;
ArrayList<PVector> moves;

int square_length;
int left_padding, top_padding;

PVector click_square;

boolean selected;
PVector selected_square;

String chance;

void setup() {
  fullScreen();

  textSize(30);
  textAlign(CENTER);
  loadedAudio = false;

  init();
}

void init() {
  square_length = 100;
  top_padding = (height - 8 * square_length) / 2;
  left_padding = (width - 8 * square_length) / 2;

  pieces = new ArrayList<Piece>();
  moves = new ArrayList<PVector>();

  setupPieces();

  click_square = new PVector(0, 0);
  selected = false;
  selected_square = new PVector(0, 0);

  chance = "white";
  
  loadAudio();
}

void loadAudio() {
  selected_sound = new SoundFile(this, "/audio/selected.wav");
  placed_sound = new SoundFile(this, "/audio/placed.wav");
  loadedAudio = true;
}

void draw() {

  background(0);
  noStroke();

  for (int file = 0; file < 8; file++) {
    for (int rank = 0; rank < 8; rank++) {
      if ((file + rank) % 2 == 0) {
        fill(255);
      } else {
        fill(128);
      }
      rect(left_padding + file * square_length, top_padding + rank * square_length, square_length, square_length);
    }
  }

  for (Piece piece : pieces) {
    if (piece.isAlive) {
      piece.draw();
    }
  }

  if (selected) {

    for (PVector move : moves) {
      fill(255, 0, 0);
      ellipse(left_padding + (move.x + 0.5) * square_length, top_padding + (7 - move.y + 0.5) * square_length, 25, 25);
    }
    noFill();
    strokeWeight(5);
    stroke(0, 0, 255);
    rect(left_padding + selected_square.x * square_length, top_padding + selected_square.y * square_length, square_length, square_length);
  }

  fill(255);
  text("Chance: " + chance, width / 2, height - 50);
}

void mousePressed() {
  if (onBoard()) {
    click_square = getClickedSquare();

    if (moveExists()) {
      placed_sound.play();
      movePiece();
      selected = false;
      changePerspective();
      moves.clear();
    } else if (playerPieceExists()) {
      selected_sound.play();
      selected = true;
      selected_square = click_square;
    } else {
      moves.clear();
      selected = false;
    }
  } else {
    moves.clear();
    selected = false;
  }
}

void keyPressed() {
  if (key == 'r') {
    init();
  }
}
