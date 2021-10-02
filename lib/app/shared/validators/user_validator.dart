import 'package:controle_vacinacao/app/shared/global/validators.dart';

mixin UserValidator {
  String? validateName(String? name) {
    if (name == null || name.isEmpty) {
      return 'Informe seu nome completo';
    } else if (name.length <= 5) {
      return 'O nome de conter pelo menos 6 caracteres';
    } else if (name.split(' ').length < 2) {
      return 'Informe nome e sobrenome';
    } else if (RegExp('[0-9]').hasMatch(name)) {
      return 'Nome inválido';
    }
    return null;
  }

  String? validateCpf(String? cpf) {
    if (isCpfValid(cpf)) {
      return null;
    } else {
      return "CPF inválido";
    }
  }

  String? validateEmail(String? email) {
    if (email == null || isEmailValid(email)) {
      return null;
    } else {
      return "E-mail válido";
    }
  }

  String? validatePhone(String? phone) {
    if (phone == null || phone.length > 13) {
      return null;
    }
    return "Celular inválido";
  }

  String? validateBirthDate(String? birthDate) {
    if (birthDate == null || birthDate.isEmpty) {
      return "Informe a data de nascimento";
    } else {
      return null;
    }
  }
}
