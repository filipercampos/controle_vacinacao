enum ProfileEnum { A, O, C }

extension ProfileEnumDescription on ProfileEnum {
  String get value {
    if (this == ProfileEnum.A) {
      return 'A';
    }
    if (this == ProfileEnum.O) {
      return 'O';
    }
    return 'C';
  }
}
