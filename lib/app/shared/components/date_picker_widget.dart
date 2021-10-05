import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/shared/extensions/date_extension.dart';
import 'package:flutter/material.dart';

import 'input_form_field.dart';

class DatePickerWidget extends StatefulWidget {
  DatePickerWidget({
    required this.hintText,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.onDate,
    this.validator,
    this.focusNode,
    this.newFocusNode,
    this.enable = true,
    this.margin,
    this.textInputAction,
    this.usePrefixIcon = false,
  });

  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final FocusNode? focusNode;
  final FocusNode? newFocusNode;
  final Function(String?)? onChanged;
  final Function(String?)? validator;
  final Function(DateTime?)? onDate;
  final bool enable;
  final EdgeInsetsGeometry? margin;
  final TextInputAction? textInputAction;
  final bool usePrefixIcon;
  @override
  _DatePickerWidgetState createState() => _DatePickerWidgetState();
}

class _DatePickerWidgetState extends State<DatePickerWidget> {
  //Essa proprieda é ouvida a partir da ui que contem o TextFormField
  //FormKey invoca errorText
  //Neste caso eu preciso invocar o metodo manualmente
  //A partir do state do context do widget
  String? _errorText;
  late TextEditingController controller;
  @override
  void initState() {
    super.initState();
    if (widget.controller == null) {
      controller = TextEditingController();
    } else {
      controller = widget.controller!;
    }
  }

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return InkWell(
      onTap: widget.enable
          ? () {
              _selectDate(
                DateTime(now.year, DateTime.now().month, now.day),
                DateTime(now.year - 70, DateTime.now().month, 1),
              );
            }
          : null,
      child: IgnorePointer(
        child: Container(
          child: InputFormField(
            hintText: widget.hintText,
            controller: controller,
            labelText: widget.labelText,
            icon: !widget.usePrefixIcon ? Icon(Icons.date_range) : null,
            prefixIcon: widget.usePrefixIcon ? Icon(Icons.date_range) : null,
            focusNode: widget.newFocusNode,
            newFocusNode: widget.newFocusNode,
            textInputType: TextInputType.datetime,
            validator: widget.validator,
            errorText: _errorText,
            textInputAction: widget.textInputAction,
          ),
        ),
      ),
    );
  }

  /// Seleciona a data no calendário
  Future _selectDate(DateTime initialDate, DateTime firstDate) async {
    final DateTime now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 9999, now.month, now.day),
      builder: (BuildContext? context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
              colorScheme: ColorScheme.light(primary: primaryColor),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
              primaryColor: primaryColor, //Head background
              accentColor: Colors.black, //selection color
              dialogBackgroundColor: Colors.white, //Background color
              highlightColor: Colors.grey[400],
              textSelectionTheme:
                  TextSelectionThemeData(selectionColor: Colors.grey)
              //
              ),
          child: child ?? Container(),
          // child: child,
        );
      },
    );
    if (picked != null) {
      //seta a data no componente
      controller.text = picked.toFormat();
      if (widget.validator != null) {
        _errorText = widget.validator!(controller.text);
      }
      if (widget.onChanged != null) {
        widget.onChanged!(controller.text);
      }
      if (widget.onDate != null) {
        widget.onDate!(picked);
      }

      setState(() {});
    }
  }
}
