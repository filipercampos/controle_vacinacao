import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_form_field.dart';

///TextFormField Custom no border
class InputFormFieldBorder extends InputFormField {
  InputFormFieldBorder({
    TextEditingController? controller,
    bool enabled = true,
    String? initialValue,
    Function(String)? onChanged,
    Function(String?)? onSaved,
    Function(String?)? onSubmitted,
    FormFieldValidator<String>? validator,
    String? labelText,
    String? hintText,
    String? errorText,
    FontWeight? fontWeight,
    TextInputType? textInputType,
    List<TextInputFormatter>? inputFormatters,
    TextAlign textAlign = TextAlign.start,
    int? maxLength,
    TextCapitalization textCapitalization = TextCapitalization.none,
    FocusNode? focusNode,
    TextInputAction? textInputAction,
    bool autocorrect = false,
    bool autofocus = false,
    double? fontSize,
    double? letterSpacing,
    Color borderColor = const Color(0xFFCCCCCC),
    String? countText,
    int? maxLines,
    Icon? icon,
    Widget? suffixIcon,
    Widget? prefixIcon,
    bool obscure = false,
    Key? key,
  }) : super(
          controller: controller,
          enabled: enabled,
          initialValue: initialValue,
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
          onSubmitted: onSubmitted,
          labelText: labelText,
          hintText: hintText,
          errorText: errorText,
          fontWeight: fontWeight,
          textInputAction: textInputAction,
          textInputType: textInputType,
          inputFormatters: inputFormatters,
          textAlign: textAlign,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          focusNode: focusNode,
          autocorrect: autocorrect,
          autofocus: autofocus,
          fontSize: fontSize,
          letterSpacing: letterSpacing,
          maxLines: maxLines,
          obscure: obscure,
          inputDecoration: InputDecoration(
            icon: icon,
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            fillColor: Colors.white,
            hintText: hintText,
            labelText: labelText,
            labelStyle: TextStyle(
              color: errorText == null ? Colors.grey : Colors.red[600],
            ),
            hintStyle: TextStyle(
              color: errorText == null ? Colors.grey : Colors.red[600],
            ),
            errorStyle: TextStyle(color: Colors.red[600]),
            errorText: errorText,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(width: 1, color: borderColor),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: borderColor),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              borderSide: BorderSide(
                width: 1,
                color: primaryColor,
              ),
            ),
            counterText: null, //hide count text
          ),
        );
}
