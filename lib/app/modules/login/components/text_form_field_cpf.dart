import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldCpf extends StatelessWidget {
  TextFormFieldCpf({
    required this.hint,
    required this.prefix,
    this.suffix,
    this.obscure = false,
    this.enabled = true,
    this.textInputType,
    this.onChanged,
    this.controller,
    this.inputAction,
    this.initialValue,
    this.inputFormatters,
  });

  final TextEditingController? controller;
  final String hint;
  final String? initialValue;
  final Widget? prefix;
  final Widget? suffix;
  final bool obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool enabled;
  final TextInputAction? inputAction;
  final List<TextInputFormatter>? inputFormatters;

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
        inputFormatters: inputFormatters,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: inputAction,
        initialValue: initialValue,
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
        validator: (String? value) {
          if (value == null || value.trim().isEmpty) {
            return 'Informe o $hint.';
          } else
            return null;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
      ),
    );
  }
}
