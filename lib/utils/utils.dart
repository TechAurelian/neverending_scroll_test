import 'dart:math';

extension RandomX on Random {
  int nextIntInRange(int min, int max) => min + nextInt(max - min);
}