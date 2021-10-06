import 'dart:math';

class RandomUtil {
  static randomString() {
    final rdm = Random();
    final num = rdm.nextInt(1234567).toString();
    final year = DateTime.now().year;
    return '$num@$year';
  }
}
