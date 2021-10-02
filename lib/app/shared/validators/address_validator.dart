
import 'package:controle_vacinacao/app/modules/login/models/address.dart';

mixin AddressValidator {
  String? validateCep(String cep) {
    if (cep.isEmpty) {
      return 'CEP não informado';
    } else if (cep.length != 9) {
      if (cep.length == 8 && !cep.contains("-")) {
        return null;
      }
      return 'CEP Inválido';
    }
    return null;
  }

  String? validateStreet(String logradouro) {
    if (logradouro.isEmpty) {
      return 'Endereço não informado';
    } else if (logradouro.length < 4) {
      return 'Endereço inválido';
    }
    return null;
  }

  String? validateNeighborhood(String bairro) {
    if (bairro.isEmpty) {
      return 'Bairro não informado';
    } else if (bairro.length < 4) {
      return 'Bairro inválido';
    }
    return null;
  }

  String? validateAddressNumber(String numero) {
    if (numero.isEmpty) {
      return 'Número inválido';
    }
    return null;
  }

  String? validateComplement(String complemento) {
    if (complemento.isEmpty) {
      return null;
    }
    if (complemento.length < 3) {
      return 'Informe um complemento válido';
    }
    return null;
  }

  String? validateCity(String cidade) {
    if (cidade.isEmpty) {
      return 'Cidade não informada';
    } else if (cidade.length < 3) {
      return 'Cidade inválida';
    }
    return null;
  }

  String? validateUf(String estado) {
    if (estado.isEmpty) {
      return 'UF não informada';
    } else if (estado.length != 2) {
      return 'UF inválida';
    }
    return null;
  }

  String? validateAddressName(String name) {
    if (name.isEmpty) {
      return null;
    } else if (name.length < 3) {
      return 'Nome de endereço válido';
    }
    return null;
  }

  bool validateAddress(Address? endereco) {
    if (endereco == null) return false;
    String? logradouroError = validateStreet(endereco.logradouro);
    String? bairroError = validateNeighborhood(endereco.bairro);
    String? numeroError = validateAddressNumber(endereco.numero);
    String? cepError = validateCep(endereco.cep);
    String? cidadeError = validateCity(endereco.cidade);
    String? ufError = validateUf(endereco.estado);

    return logradouroError == null &&
        bairroError == null &&
        numeroError == null &&
        cepError == null &&
        cidadeError == null &&
        ufError == null &&
        endereco.hasCoordination;
  }
}
