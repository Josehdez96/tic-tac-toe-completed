import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/presentation/cubit_impl/cubit_tic_tac_toe_state.dart';

class CubitTicTacToeCubit extends Cubit<CubitTicTacToeState> {
  CubitTicTacToeCubit(super.initialState);

  List<String> get board => state.board;

  void resetGame() {
    emit(const CubitTicTacToeInitialState());
  }

  void makeAMove(BuildContext context, int index) {
    if (state.gameEnded || state.board[index].isNotEmpty) return;

    final List<String> board = [...state.board];
    board[index] = state.currentPlayer;

    if (checkWinner(board)) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text('Game Over'),
          content: Text('Player ${state.currentPlayer} wins!'),
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
      emit(const CubitTicTacToeGameEnds());
    } else if (board.every((cell) => cell.isNotEmpty)) {
      // Draw game
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
      emit(const CubitTicTacToeGameEnds());
    } else {
      emit(
        CubitTicTacToeMakeAMove(
          boardMoved: board,
          currentPlayer: state.currentPlayer == 'X' ? 'O' : 'X',
        ),
      );
    }
  }

  bool checkWinner(List<String> comparableBoard) {
    final List<String> board = comparableBoard;
    final String player = state.currentPlayer;

    // Rows
    for (int i = 0; i < 9; i += 3) {
      if (board[i] == player &&
          board[i + 1] == player &&
          board[i + 2] == player) {
        return true;
      }
    }

    // Columns
    for (int i = 0; i < 3; i++) {
      if (board[i] == player &&
          board[i + 3] == player &&
          board[i + 6] == player) {
        return true;
      }
    }

    // Diagonals
    if (board[0] == player && board[4] == player && board[8] == player) {
      return true;
    }
    if (board[2] == player && board[4] == player && board[6] == player) {
      return true;
    }

    return false;
  }
}
