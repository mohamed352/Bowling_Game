abstract  class GameRules {
  void play(int frame);
  int getScore();
  void playAll(List<int> pins) {
    for (var frame in pins) {
      play(frame);
    }
  }
}
