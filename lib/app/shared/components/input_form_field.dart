import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///TextFormField Custom no border
class InputFormField extends StatelessWidget {
  const InputFormField({
    this.key,
    this.enabled = true,
    this.initialValue,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.onSubmitted,
    this.labelText,
    this.hintText,
    this.errorText,
    this.fontWeight,
    this.textInputType,
    this.inputFormatters,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.textCapitalization = TextCapitalization.none,
    this.focusNode,
    this.autocorrect = false,
    this.autofocus = false,
    this.fontSize,
    this.letterSpacing,
    this.border = false,
    this.inputDecoration,
    this.icon,
    this.controller,
    TextInputAction? textInputAction,
    this.newFocusNode,
    this.borderColor = const Color(0xFFCCCCCC),
    this.maxLines,
    this.readOnly = false,
    this.suffixIcon,
    this.prefixIcon,
    this.countText = '',
    this.inputFormattersLength,
  })  : this.textInputAction = onSubmitted == null
            ? TextInputAction.done
            : textInputAction ?? TextInputAction.next,
        super(key: key);

  final bool enabled;
  final String? initialValue;
  final Function(String?)? onChanged;
  final Function(String?)? onSaved;
  final Function(String)? onSubmitted;
  final Function(String)? validator;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final TextAlign textAlign;
  final int? maxLength;
  final TextCapitalization textCapitalization;
  final FocusNode? focusNode;
  final FocusNode? newFocusNode;
  final TextInputAction? textInputAction;
  final bool autocorrect;
  final bool autofocus;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final InputDecoration? inputDecoration;
  final Icon? icon;
  final bool border;
  final TextEditingController? controller;
  final Color borderColor;
  final String? countText;
  final int? maxLines;
  final bool readOnly;
  final int? inputFormattersLength;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Key? key;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      enabled: enabled,
      controller: controller,
      initialValue: initialValue,
      onChanged: onChanged,
      onSaved: onSaved,
      validator: (value) {
        if (this.validator != null) {
          return validator!(value ?? '');
        }
        return null;
      },
      keyboardType: textInputType,
      inputFormatters: inputFormatters ??
          [
            LengthLimitingTextInputFormatter(inputFormattersLength),
          ],
      maxLength: maxLength,
      maxLines: maxLines,
      textAlign: textAlign,
      focusNode: focusNode,
      textCapitalization: textCapitalization,
      onFieldSubmitted: textInputAction != null
          ? (text) {
              if (focusNode != null) {
                focusNode!.unfocus();
              }
              if (newFocusNode != null) {
                FocusScope.of(context).requestFocus(newFocusNode);
              }
              if (onSubmitted != null) {
                onSubmitted!(text);
              }
            }
          : null,
      textInputAction: textInputAction,
      autocorrect: autocorrect,
      autofocus: autofocus,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        letterSpacing: letterSpacing,
      ),
      cursorColor: Colors.black,
      readOnly: readOnly,
      decoration: inputDecoration == null
          ? InputDecoration(
              fillColor: Colors.white,
              hintText: hintText,
              labelText: labelText,
              icon: icon,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              labelStyle: TextStyle(
                color: errorText == null ? Colors.grey : Colors.red[600],
              ),
              border: border
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                  : null,
              hintStyle: TextStyle(
                color: errorText == null ? Colors.grey : Colors.red[600],
              ),
              errorStyle: TextStyle(color: Colors.red[600]),
              errorText: errorText,
              counterText: countText, //string empty to hide count text
            )
          : inputDecoration,
    );
  }
}
