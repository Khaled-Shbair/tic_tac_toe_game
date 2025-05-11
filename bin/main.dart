import 'dart:io';
import 'tic_tac_toe.dart';

/// Khaled Shbair - Flutter developer
/// Gaza Sky Geeks (GSG)
void main() {
  print('Welcome to Tic-Tac-Toe Game');
  String? firstPlayer;

  while (true) {
    while (true) {
      print('First Player Choose (X) or (O)?');
      String? input = stdin.readLineSync();
      if (input != null &&
          (input.toLowerCase() == 'x' || input.toLowerCase() == 'o')) {
        firstPlayer = input.toUpperCase();
        break;
      } else {
        print("Invalid Choose. Please try again.");
      }
    }
    TicTacToe game = TicTacToe(firstPlayer);
    game.startGame();
    print("Do you want to play again? (y/n)");
    String? playChoice = stdin.readLineSync();
    if (playChoice != null && playChoice.toLowerCase() != 'y') {
      break;
    }
  }
}
