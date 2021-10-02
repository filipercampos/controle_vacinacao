import 'package:controle_vacinacao/app/shared/global/validators.dart';

mixin SingupValidator {
  String? validateName(String name) {
    if (name.isEmpty || name.length < 6) return 'Mínimo 6 caracteres';
    //se apenas colocou espaço
    if (!name.contains(' ') ||
        (name.contains(' ') && name.split(' ')[1].length < 2)) {
      return 'Informe o nome e sobrenome';
    }
    return null;
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Campo obrigatório';
    } else {
      if (isEmailValid(email)) {
        return null;
      }
      return 'E-mail inválido';
    }
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Campo obrigatório';
    } else if (password.length < 6 ||
        !password.contains(RegExp('[0-9]')) ||
        !password.contains(RegExp('[a-z]'))) {
      return 'Senha fraca';
    } else if (!password.contains(RegExp('[A-Z]', caseSensitive: true))) {
      return 'Use uma letra maíuscula';
    }

    return null;
  }

  String? validatePasswords(String password, String password2) {
    if (password.isEmpty || password2.isEmpty || password2 != password) {
      return 'Senhas não conferem';
    }
    return null;
  }
}
