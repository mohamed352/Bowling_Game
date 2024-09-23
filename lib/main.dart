import 'dart:io';

import 'package:tdd_test/logic/bolling_game.dart';

void main(List<String> arguments) {
  stdout.write("Hello Welcome To My Bolling Calculator Score \n");
  final BowlingGame game = BowlingGame();
  int count = 1;
  do {
    stdout.write("Enter Your Score in Frame Number  $count : ");
    final int? frame = int.tryParse(stdin.readLineSync().toString());
    if (frame != null&&frame>=0&&frame<=10) {
      game.play(frame);
      
      count++;
    } else {
      stdout.write("Your Input is Not Valid only Valid Number from 0 to 10 \n");
    }
    
  } while (count <= 12);
  print('Your Total Score is : ${game.getScore()}');
}
