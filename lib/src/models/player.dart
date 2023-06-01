abstract class Move {
  List<List<String>> movimiento(List<List<String>> board, int x, int y);
}

class Player implements Move {
  String _symbol;

  Player(this._symbol);
  @override
  List<List<String>> movimiento(List<List<String>> board, int row, int col) {
    board[row][col] = _symbol;
    return board;
  }
}
