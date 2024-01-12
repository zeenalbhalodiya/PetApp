import '../../../../utils/process_indicator.dart' as circles;

class CircleLoader {
  static final inc = CircleLoader._internal();
  factory CircleLoader() {
    return inc;
  }

  static final loader = circles.Circle();
  CircleLoader._internal();
}
