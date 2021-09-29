import 'package:flutter/material.dart';

class TextFieldLogin extends StatelessWidget {
  TextFieldLogin({
    required this.hint,
    required this.prefix,
    this.suffix,
    this.obscure = false,
    this.enabled=true,
    this.textInputType,
    this.onChanged,
    this.controller,
    this.inputAction,
    this.initialValue,
  });

  final String hint;
  final TextEditingController? controller;
  final String? initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final bool enabled;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final TextInputAction? inputAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        initialValue: initialValue,
        autocorrect: false,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: prefix,
          suffixIcon: suffix,
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderSide: BorderSide(
              style: BorderStyle.none,
              width: 0,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
        ),
        validator: (value) {
          if (value == null || value.trim().isEmpty) {
            return 'Informe $hint.';
          } else
            return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        textInputAction: inputAction,
      ),
    );
  }
}
