import 'package:tdd_test/logic/bolling_game.dart';
import 'package:test/test.dart';

void main() {
  late BowlingGame game;
  setUp(() {
    game = BowlingGame();
  });

  test(" do nothing ", () {
    expect(1, 1);
  });
  test("should get Score is zero when play is zero", () {
    game.play(0);
    expect(game.getScore(), 0);
  });
  test("open frame and add  pins", () {
    game.playAll([3, 4]);
    expect(game.getScore(), 7);
  });

  test(" when it is spare add next ball to Score", () {
    game.playAll([4, 6, 3, 0]);
    expect(game.getScore(), 16);
  });
  test(' a ten in two frames is not a spare', () {
    game.playAll([3, 6, 4, 3]);

    expect(game.getScore(), 16);
  });
  test(' a Strike adds two next  balls ', () {
    game.playAll([10, 3, 2]);
    expect(game.getScore(), 20);
  });
  test('perfect game score is 300', () {
    for (int i = 0; i < 12; i++) {
      game.play(10);
    }

    expect(game.getScore(), 300);
  });
}
