import 'dart:math';

class UniqueCharGenerator {
  static Random random = Random();

  static String getChar() {
    return String.fromCharCode(
        random.nextInt(26) + 65); // Generates a random uppercase letter
  }
}
