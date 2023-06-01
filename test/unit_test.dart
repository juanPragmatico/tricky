import 'package:flutter_test/flutter_test.dart';
import 'package:tictaetoc/src/viewModel/game_logic.dart';

void main() {
  group('Game', () {
    test('markSquare should switch the current player after marking a square', () {
      final game = BaseLogic();
      game.setBoardWithMark(0, 0);
      expect(game.turn, equals(false));
    });

    test('markSquare should show a winner message if there is a winner', () {
      final game = BaseLogic();
      game.setBoardWithMark(0, 0);
      game.setBoardWithMark(0, 1);
      game.setBoardWithMark(1, 0);
      game.setBoardWithMark(0, 2);
      game.setBoardWithMark(2, 0);
      expect(game.isThereAWinner, equals(true));
    });

    test('markSquare should show who is the winner', () {
      final game = BaseLogic();
      game.setBoardWithMark(0, 0);
      game.setBoardWithMark(0, 1);
      game.setBoardWithMark(1, 0);
      game.setBoardWithMark(0, 2);
      game.setBoardWithMark(2, 0);
      expect(game.isThereAWinner, equals(true));
    });

 
  });
}