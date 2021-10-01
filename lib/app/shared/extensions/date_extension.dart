import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateExtension on DateTime? {
  bool get isNull {
    return this == null;
  }

  /// Formata a data em formato dd/MM/yyyy
  String toFormat() {
    if (this == null) {
      return "";
    }
    var formatter = DateFormat('dd/MM/yyyy');
    String formatted = formatter.format(this as DateTime);
    return formatted;
  }

  /// Formata a data em formato dd/MM/yyyy HH:mm
  String toFormatDateHour() {
    if (this == null) {
      return "";
    }
    var formatter = DateFormat('dd/MM/yyyy HH:mm:ss');
    String formatted = formatter.format(this as DateTime);
    return formatted;
  }

  /// Formata a data em formato dd/MM/yyyy HH:mm
  String toFormatDateHourNon() {
    if (this == null) {
      return "";
    }
    var formatter = DateFormat('dd/MM/yyyy HH:mm');
    String formatted = formatter.format(this as DateTime);
    return formatted;
  }

  /// Formata a data em formato HH:mm:ss
  String toFormatHour() {
    if (this == null) {
      return "";
    }
    var formatter = DateFormat('HH:mm:ss');
    String formatted = formatter.format(this as DateTime);
    return formatted;
  }

  /// Formata a data em formato HH:mm
  String toFormatHourMinutes() {
    if (this == null) {
      return "";
    }
    var formatter = DateFormat('HH:mm');
    String formatted = formatter.format(this as DateTime);
    return formatted;
  }

  /// Formata a data em formato yyyy-MM-dd
  String toFormatSql() {
    if (this == null) {
      return "";
    }
    var formatter = DateFormat('yyyy-MM-dd');
    String formatted = formatter.format(this as DateTime);
    return formatted;
  }

  ///Formata data em month-name/year
  ///   Julho/2020
  String get monthExension {
    if (this == null) return "";

    return "${this.weekDayName} ${this?.day} ${this.monthName}/${this?.year}";
  }

  ///Formata data em month-name/year
  ///   Julho/2020
  String get getMonthNameYear {
    if (this == null) return "";
    return "${this.monthName}/${this?.year}";
  }

  /// Verfica se a data é sábado
  isSaturday() {
    return this?.weekday == DateTime.saturday;
  }

  /// Verifica se a data é domingo
  isSunday() {
    return this?.weekday == DateTime.sunday;
  }

  /// Verifica se a data é um dia útil
  isUsefulDay() {
    return this?.weekday != DateTime.saturday &&
        this?.weekday != DateTime.sunday;
  }

  //// Verifica se a data é o dia de hoje
  bool isToday() {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final dateCheck = DateTime(this!.year, this!.month, this!.day);
    return today == dateCheck;
  }

  String get weekDayName {
    if (this == null) return "";
    switch (this?.weekday) {
      case DateTime.monday:
        return 'Segunda-Feira';
      case DateTime.tuesday:
        return 'Terça-Feira';
      case DateTime.wednesday:
        return 'Quarta-Feira';
      case DateTime.thursday:
        return 'Quinta-Feira';
      case DateTime.friday:
        return 'Sexta-Feira';
      case DateTime.saturday:
        return 'Sábado';
      case DateTime.sunday:
        return 'Domingo';
      default:
        debugPrint("Erro dia da semana");
        return "";
    }
  }

  String get monthName {
    switch (this?.month) {
      case DateTime.january:
        return 'Janeiro';
      case DateTime.february:
        return 'Fevereiro';
      case DateTime.march:
        return 'Março';
      case DateTime.april:
        return 'Abril';
      case DateTime.may:
        return 'Maio';
      case DateTime.june:
        return 'Junho';
      case DateTime.july:
        return 'Julho';
      case DateTime.august:
        return 'Agosto';
      case DateTime.september:
        return 'Setembro';
      case DateTime.october:
        return 'Outubro';
      case DateTime.november:
        return 'Novembro';
      case DateTime.december:
        return 'Dezembro';
      default:
        return 'Mes invalido';
    }
  }

  ///Data sem hora
  DateTime get toDateZero {
    var newDate = DateTime(this!.year, this!.month, this!.day);
    return newDate;
  }
}
