import 'package:intl/intl.dart';

extension NumExtension on num? {
  ///Formata casas decimais do brasil
  String toFormatBr() {
    if (this == null) {
      return "0,00";
    }
    return NumberFormat("#,##0.00", "pt_BR").format(this);
  }

  /// Formata para moeda corrente
  String toFormatCurrency() {
    return NumberFormat.currency().format(this);
  }
}
