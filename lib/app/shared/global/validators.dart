

///Validate email
bool isEmailValid(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }
  final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
  return regex.hasMatch(email);
}

///Validate CPF
bool isCpfValid(String? cpf) {
  if (cpf == null || cpf.isEmpty) return false;

  // Obter somente os números do CPF
  var numeros = cpf.replaceAll(RegExp(r'[^0-9]'), '');

  // Testar se o CPF possui 11 dígitos
  if (numeros.length != 11) return false;

  // Testar se todos os dígitos do CPF são iguais
  if (RegExp(r'^(\d)\1*$').hasMatch(numeros)) return false;

  // Dividir dígitos
  List<int> digitos =
      numeros.split('').map((String d) => int.parse(d)).toList();

  // Calcular o primeiro dígito verificador
  var calcDv1 = 0;
  for (var i in Iterable<int>.generate(9, (i) => 10 - i)) {
    calcDv1 += digitos[10 - i] * i;
  }
  calcDv1 %= 11;
  var dv1 = calcDv1 < 2 ? 0 : 11 - calcDv1;

  // Testar o primeiro dígito verificado
  if (digitos[9] != dv1) return false;

  // Calcular o segundo dígito verificador
  int calcDv2 = 0;
  for (var i in Iterable<int>.generate(10, (i) => 11 - i)) {
    calcDv2 += digitos[11 - i] * i;
  }
  calcDv2 %= 11;
  var dv2 = calcDv2 < 2 ? 0 : 11 - calcDv2;

  // Testar o segundo dígito verificador
  if (digitos[10] != dv2) return false;

  return true;
} 

bool isNumeric(String? text) {
  if (text == null || text.isEmpty) return false;
  final alphanumeric = RegExp('[0-9]');
  return alphanumeric.hasMatch(text);
}

String? isNumberPhone(String value) {
  final pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  final regExp = RegExp(pattern);
  if (value.length == 0 || !regExp.hasMatch(value)) {
    return 'Número telefone inválido';
  }
  return null;
}
