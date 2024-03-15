abstract class CubitTicTacToeState {
  const CubitTicTacToeState({
    this.board = const ['', '', '', '', '', '', '', '', ''],
    this.currentPlayer = 'X',
    this.gameEnded = false,
  });

  final List<String> board;
  final String currentPlayer;
  final bool gameEnded;
}

class CubitTicTacToeInitialState extends CubitTicTacToeState {
  const CubitTicTacToeInitialState()
      : super(
          board: const ['', '', '', '', '', '', '', '', ''],
          currentPlayer: 'X',
          gameEnded: false,
        );
}

class CubitTicTacToeMakeAMove extends CubitTicTacToeState {
  const CubitTicTacToeMakeAMove({
    required List<String> boardMoved,
    required String currentPlayer,
  }) : super(board: boardMoved, currentPlayer: currentPlayer);
}

class CubitTicTacToeGameEnds extends CubitTicTacToeState {
  const CubitTicTacToeGameEnds() : super(gameEnded: true);
}
