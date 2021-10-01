extension StringExtension on String? {
  bool get isNotNull {
    return this != null;
  }

  bool get isNullOrEmpty {
    return this == null || this!.isEmpty;
  }

  String get text {
    if (this == null || this!.isEmpty) return "";
    return this!;
  }

  String get firstName {
    if (this == null) return '';
    final split = this!.split(' ');
    if (split.length > 1) {
      return '${split[0]} ${split[split.length - 1]}';
    }
    return '';
  }
}
