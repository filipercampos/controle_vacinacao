import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateUtil {
  DateUtil._internal();

  static DateTime now({bool zero = false}) {
    var now = DateTime.now();
    if (zero) {
      return DateTime(now.year, now.month, now.day);
    }
    return now;
  }

  static DateTime? toDate(String? dateString) {
    if (dateString == null || dateString.isEmpty) {
      return null;
    }
    return DateFormat("dd/MM/yyyy").parse(dateString);
  }

  /// Recupera o intervalo existente entre duas datas
  static int getDiffDays(DateTime dateInit, DateTime dateEnd) {
    final difference = dateEnd.difference(dateInit).inDays;
    return difference;
  }

  /// Adiciona os dias na data informada
  static DateTime addDays(DateTime date, int days) {
    return date.add(Duration(days: days));
  }

  /// Recupera a data atual no primeiro dia do mês
  static firstDateFromMonth() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, 1);
  }

  /// Recupera a data atual no último dia do mês
  static lastDateFromMonth() {
    var now = DateTime.now();
    return DateTime(now.year, now.month, 0);
  }

  ///Converte o int em DateTime
  static DateTime? toDateFromMillisecondsSinceEpoch(
      int? millisecondsSinceEpoch) {
    if (millisecondsSinceEpoch == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(millisecondsSinceEpoch);
  }

  ///Converte o Timestamp em DateTime
  static DateTime? toDateFromTimestamp(Timestamp? timestamp) {
    if (timestamp == null) {
      return null;
    }
    return DateTime.fromMillisecondsSinceEpoch(
        timestamp.millisecondsSinceEpoch);
  }

  ///Primeria data do mês
  static DateTime getFirstDate() {
    var now = DateTime.now();
    var date = DateTime(now.year, now.month, 1);
    return date;
  }

  ///Último data do mes
  static DateTime getLastDate() {
    var now = DateTime.now();
    var date = DateTime(now.year, now.month + 1, 0);
    return date;
  }

  static DateTime getFirstDateMonth(int month) {
    var now = DateTime.now();
    var date = DateTime(now.year, month, 1);
    return date;
  }

  static DateTime getLastDateMonth(int month) {
    var now = DateTime.now();
    var date = DateTime(now.year, month + 1, 0);
    return date;
  }

  static DateTime getDateFirebase() {
    var now = Timestamp.now();
    return toDateFromTimestamp(now)!;
  }

  static Duration? toHour(String? hourString) {
    if (hourString == null || hourString.isEmpty) {
      return null;
    }
    var split = hourString.split(':');
    var hour = int.parse(split[0]);
    var minutes = int.parse(split[1]);
    return Duration(hours: hour, minutes: minutes);
  }

  static String formatHourDuration(Duration? duration, {seconds = false}) {
    if (duration == null) {
      return '';
    }
    String twoDigits(int n) => n.toString().padLeft(2, "0");
    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String totalHoras = '${twoDigits(duration.inHours)}:$twoDigitMinutes';
    if (seconds) {
      totalHoras += ':$twoDigitSeconds';
    }
    return totalHoras;
  }
}
