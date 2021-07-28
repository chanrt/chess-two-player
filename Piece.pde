class Piece {

  String player, type;
  PVector position;
  PImage image;
  boolean isAlive;

  // simplest constructor
  Piece(String player, String type, String position_string) {
    this.isAlive = true;
    this.player = player;
    this.type = type;
    this.position = getPositionVector(position_string);
    this.image = loadImage("sprites/" + this.player + "_" + this.type + ".png");
  }
  
  void flipPosition() {
    position.x = 7 - position.x;
    position.y = 7 - position.y;
  }
  
  void draw() {
    image(this.image, left_padding + this.position.x * square_length, top_padding + (7 - this.position.y) * square_length, square_length, square_length);
  }
  
  boolean atPosition(float file, float rank) {
    return (file == position.x && rank == position.y);
  }
  
  void getMoves() {
    if(type == "pawn") {
      getPawnMoves(int(position.x), int(position.y));
    }
    else if(type == "knight") {
      getKnightMoves(int(position.x), int(position.y));
    }
    else if(type == "bishop") {
      getBishopMoves(int(position.x), int(position.y));
    }
    else if(type == "rook") {
      getRookMoves(int(position.x), int(position.y));
    }
    else if(type == "queen") {
      getBishopMoves(int(position.x), int(position.y));
      getRookMoves(int(position.x), int(position.y));
    }
    else if(type == "king") {
      getKingMoves(int(position.x), int(position.y));
    }
  }
  
  void moveTo(float file, float rank) {
    position.x = file;
    position.y = rank;
  }
  
  void kill() {
    this.isAlive = false;
  }
}
