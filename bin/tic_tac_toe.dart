import 'dart:io';

class TicTacToe {
  List board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
  String currentPlayer;

  TicTacToe(this.currentPlayer);

  void startGame() {
    for (int x = 0; x < board.length; x++) {
      boardDraw();
      playerMove();
      if (!isWinner() && !(board.length < 9)) {
        switchPlayer();
      } else {
        break;
      }
    }
    boardDraw();
    if (isWinner()) {
      print("Player ($currentPlayer) wins.");
    } else {
      print("The result is a draw.");
    }
  }

  void boardDraw() {
    print('\n ${board[0]} | ${board[1]} | ${board[2]} ');
    print('---|---|---');
    print(' ${board[3]} | ${board[4]} | ${board[5]} ');
    print('---|---|---');
    print(' ${board[6]} | ${board[7]} | ${board[8]} \n');
  }

  void playerMove() {
    for (int x = 1; x <= 9; x++) {
      print("Player $currentPlayer, enter your move (1-9): ");
      String? input = stdin.readLineSync();
      int boxNumber = int.tryParse(input ?? '') ?? 0;
      if (boxNumber < 1 || boxNumber > 9 || board[boxNumber - 1] != ' ') {
        print("Invalid move. Please try again.");
      } else {
        board[boxNumber - 1] = currentPlayer;
        break;
      }
    }
  }

  bool isWinner() {
    List winningConditions = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], // Horizontally
      [0, 3, 6], [1, 4, 7], [2, 5, 8], // Vertically
      [0, 4, 8], [2, 4, 6] // Diagonals
    ];

    for (var condition in winningConditions) {
      if (board[condition[0]] == currentPlayer &&
          board[condition[1]] == currentPlayer &&
          board[condition[2]] == currentPlayer) {
        return true;
      }
    }
    return false;
  }

  void switchPlayer() {
    currentPlayer = currentPlayer == 'X' ? 'O' : 'X';
  }
}
