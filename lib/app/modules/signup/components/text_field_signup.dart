import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFieldSignup extends StatelessWidget {
  final String? initialValue;
  final String? hintText;
  final bool? enabled;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final String? errorText;
  final TextCapitalization? textCapitalization;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final bool autocorrect;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  const TextFieldSignup(
      {Key? key,
      this.initialValue,
      this.enabled,
      this.errorText,
      this.textInputType,
      this.onChanged,
      this.hintText,
      this.autocorrect = true,
      this.textCapitalization,
      this.focusNode,
      this.onSubmitted,
      this.inputFormatters})
      : textInputAction =
            onSubmitted == null ? TextInputAction.done : TextInputAction.next;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: initialValue,
      enabled: enabled,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        hintText: hintText,
        isDense: true,
        errorText: errorText,
      ),
      keyboardType: textInputType,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      autocorrect: autocorrect,
      focusNode: focusNode,
      onFieldSubmitted: onSubmitted,
    );
  }
}
