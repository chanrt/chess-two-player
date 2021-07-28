void getPawnMoves(int file, int rank) {
  if (rank < 7) {
    if (isEmpty(file, rank + 1)) {
      moves.add(new PVector(file, rank + 1));

      if (rank == 1 && isEmpty(file, rank + 2)) {
        moves.add(new PVector(file, rank + 2));
      }
    }
    if (hasEnemy(file - 1, rank + 1)) {
      moves.add(new PVector(file - 1, rank + 1));
    }
    if (hasEnemy(file + 1, rank + 1)) {
      moves.add(new PVector(file + 1, rank + 1));
    }
  }
}

void getKnightMoves(int file, int rank) {
  if (canMoveTo(file - 1, rank - 2)) {
    moves.add(new PVector(file - 1, rank - 2));
  }
  if (canMoveTo(file - 2, rank - 1)) {
    moves.add(new PVector(file - 2, rank - 1));
  }
  if (canMoveTo(file + 1, rank - 2)) {
    moves.add(new PVector(file + 1, rank - 2));
  }
  if (canMoveTo(file + 2, rank - 1)) {
    moves.add(new PVector(file + 2, rank - 1));
  }
  if (canMoveTo(file - 1, rank + 2)) {
    moves.add(new PVector(file - 1, rank + 2));
  }
  if (canMoveTo(file - 2, rank + 1)) {
    moves.add(new PVector(file - 2, rank + 1));
  }
  if (canMoveTo(file + 1, rank + 2)) {
    moves.add(new PVector(file + 1, rank + 2));
  }
  if (canMoveTo(file + 2, rank + 1)) {
    moves.add(new PVector(file + 2, rank + 1));
  }
}

void getBishopMoves(int file, int rank) {
  int new_file = file - 1;
  int new_rank = rank - 1;

  while (canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if (hasEnemy(new_file, new_rank)) {
      break;
    }
    new_file--;
    new_rank--;
  }

  new_file = file + 1; 
  new_rank = rank - 1;
  while (canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if (hasEnemy(new_file, new_rank)) {
      break;
    }
    new_file++;
    new_rank--;
  }

  new_file = file - 1; 
  new_rank = rank + 1;
  while (canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if (hasEnemy(new_file, new_rank)) {
      break;
    }
    new_file--;
    new_rank++;
  }

  new_file = file + 1; 
  new_rank = rank + 1;
  while (canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if (hasEnemy(new_file, new_rank)) {
      break;
    }
    new_file++;
    new_rank++;
  }
}

void getRookMoves(int file, int rank) {
  int new_file = file - 1;
  int new_rank = rank;
  while(canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if(hasEnemy(new_file, new_rank)) {
      break;
    }
    new_file--;
  }
  
  new_file = file;
  new_rank = rank - 1;
  while(canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if(hasEnemy(new_file, new_rank)) {
      break;
    }
    new_rank--;
  }
  
  new_file = file + 1;
  new_rank = rank;
  while(canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if(hasEnemy(new_file, new_rank)) {
      break;
    }
    new_file++;
  }
  
  new_file = file;
  new_rank = rank + 1;
  while(canMoveTo(new_file, new_rank)) {
    moves.add(new PVector(new_file, new_rank));
    if(hasEnemy(new_file, new_rank)) {
      break;
    }
    new_rank++;
  }
}

void getKingMoves(int file, int rank) {
  if(canMoveTo(file - 1, rank - 1)) {
    moves.add(new PVector(file - 1, rank - 1));
  }
  if(canMoveTo(file - 1, rank)) {
    moves.add(new PVector(file - 1, rank));
  }
  if(canMoveTo(file - 1, rank + 1)) {
    moves.add(new PVector(file - 1, rank + 1));
  }
  if(canMoveTo(file, rank - 1)) {
    moves.add(new PVector(file, rank - 1));
  }
  if(canMoveTo(file, rank + 1)) {
    moves.add(new PVector(file, rank + 1));
  }
  if(canMoveTo(file + 1, rank - 1)) {
    moves.add(new PVector(file + 1, rank - 1));
  }
  if(canMoveTo(file + 1, rank)) {
    moves.add(new PVector(file + 1, rank));
  }
  if(canMoveTo(file + 1, rank + 1)) {
    moves.add(new PVector(file + 1, rank + 1));
  }
}
