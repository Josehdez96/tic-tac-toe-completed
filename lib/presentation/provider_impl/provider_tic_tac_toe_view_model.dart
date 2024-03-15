import 'package:flutter/material.dart';

class ProviderTicTacToeViewModel extends ChangeNotifier {
  List<String> _board = List.filled(9, '');
  List<String> get board => _board;

  String _currentPlayer = 'X';
  String get currentPlayer => _currentPlayer;

  bool _gameEnded = false;
  bool get gameEnded => _gameEnded;

  void resetGame() {
    _board = List.filled(9, '');
    _currentPlayer = 'X';
    _gameEnded = false;
    notifyListeners();
  }

  void makeAMove(BuildContext context, int index) {
    if (_gameEnded || _board[index].isNotEmpty) return;

    _board[index] = _currentPlayer;
    if (checkWinner(_currentPlayer)) {
      _gameEnded = true;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Game Over'),
          content: Text('Player $_currentPlayer wins!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      );
    } else if (_board.every((cell) => cell.isNotEmpty)) {
      // Draw game
      _gameEnded = true;
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Game Over'),
          content: const Text('It\'s a draw!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetGame();
              },
              child: const Text('Play Again'),
            ),
          ],
        ),
      );
    } else {
      _currentPlayer = _currentPlayer == 'X' ? 'O' : 'X';
    }
    notifyListeners();
  }

  bool checkWinner(String player) {
    // Rows
    for (int i = 0; i < 9; i += 3) {
      if (_board[i] == player &&
          _board[i + 1] == player &&
          _board[i + 2] == player) {
        return true;
      }
    }

    // Columns
    for (int i = 0; i < 3; i++) {
      if (_board[i] == player &&
          _board[i + 3] == player &&
          _board[i + 6] == player) {
        return true;
      }
    }

    // Diagonals
    if (_board[0] == player && _board[4] == player && _board[8] == player) {
      return true;
    }
    if (_board[2] == player && _board[4] == player && _board[6] == player) {
      return true;
    }

    return false;
  }
}
