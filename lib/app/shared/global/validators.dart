

///Validate email
bool isEmailValid(String? email) {
  if (email == null || email.isEmpty) {
    return false;
  }
  final RegExp regex = RegExp(
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$");
  return regex.hasMatch(email);
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
