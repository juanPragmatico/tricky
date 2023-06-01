import 'package:flutter/material.dart';

import '../models/player.dart';

class BaseLogic extends ChangeNotifier {
  late Player _player1;
  late Player _player2;
  late List<List<String>> _board;
  late bool _turn;
  late bool _isGameIn;
  late bool _isThereAWinner;

  BaseLogic() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ' '));
    _player1 = Player('X');
    _player2 = Player(
      'O',
    );
    _isGameIn = false;
    _isThereAWinner = false;
    _turn = true;
  }
//Marcar X o O en el cuadro
  void setBoardWithMark(int row, int col) {
    setBoard(_turn
        ? player1.movimiento(_board, row, col)
        : player2.movimiento(_board, row, col));
    sendStateGame();
  }

//Para iniciar la partida
  void setStage() {
    if (!_isGameIn) {
      _isGameIn = true;
    }
    notifyListeners();
  }

  //reiniciar el juego cada vez que se desee
  void resetGame() {
    _board = List.generate(3, (_) => List.generate(3, (_) => ' '));
    _isGameIn = false;
    _turn = true;
    _isThereAWinner = false;
    notifyListeners();
  }

//Enviar el estado del board para validar si hay ganador o empate
  void sendStateGame() {
    _isThereAWinner = hasWinner();
    if (!_isThereAWinner) {
      if (!_turn) {
        _turn = true;
      } else {
        _turn = false;
      }
    }
    notifyListeners();
  }

//Revisar el estado del board para validar si hay ganador o empate

  bool hasWinner() {
    for (var i = 0; i < 3; i++) {
      if (_board[i][0] != ' ' &&
          _board[i][0] == _board[i][1] &&
          _board[i][1] == _board[i][2]) {
        return true;
      }
    }
    for (var i = 0; i < 3; i++) {
      if (_board[0][i] != ' ' &&
          _board[0][i] == _board[1][i] &&
          _board[1][i] == _board[2][i]) {
        return true;
      }
    }

    if (_board[0][0] != ' ' &&
        _board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2]) {
      return true;
    }
    if (_board[0][2] != ' ' &&
        _board[0][2] == _board[1][1] &&
        _board[1][1] == _board[2][0]) {
      return true;
    }

    return false;
  }

//Gettes y setters

  get player1 => _player1;
  get player2 => _player2;
  get board => _board;
  get turn => _turn;
  get isGameIn => _isGameIn;
  get isThereAWinner => _isThereAWinner;

  void setBoard(List<List<String>> board) {
    _board = board;
    notifyListeners();
  }
}
