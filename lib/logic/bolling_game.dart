import 'game_rules.dart';

class BowlingGame extends GameRules {
  final List<int> _rolled = List.filled(22, 0);
  int _currentBall = 0;

  @override
  void play(int frame) {
    _rolled[_currentBall] = frame;
    _currentBall++;
  }

  @override
  int getScore() {
    int score = 0;
    int currentFrame = 0;

    for (int frame = 0; frame < 10; frame++) {
      // 10 frames in a game
      if (_isStrike(currentFrame)) {
        score += _addTwoNextBalls(currentFrame);
        currentFrame += 1; // Move to next frame (strikes use only 1 roll)
      } else if (_isSpare(currentFrame)) {
        score += _addNextBall(currentFrame);
        currentFrame += 2; // Move to the next frame after two rolls
      } else {
        score += _sumOfPinsInFrame(currentFrame);
        currentFrame += 2;
      }
    }

    return score;
  }

  // Helper method to sum the current frame
  int _sumOfPinsInFrame(int currentFrame) {
    return _rolled[currentFrame] + _rolled[currentFrame + 1];
  }

  // Add next ball after a spare
  int _addNextBall(int currentFrame) {
    return 10 + _rolled[currentFrame + 2];
  }

  // Add two balls after a strike
  int _addTwoNextBalls(int currentFrame) {
    return 10 + _rolled[currentFrame + 1] + _rolled[currentFrame + 2];
  }

  // Check if it's a strike
  bool _isStrike(int currentFrame) {
    return _rolled[currentFrame] == 10;
  }

  // Check if it's a spare
  bool _isSpare(int currentFrame) {
    return _rolled[currentFrame] + _rolled[currentFrame + 1] == 10;
  }
}
