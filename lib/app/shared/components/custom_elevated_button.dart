import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/shared/utils/animation_util.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color = primaryColor,
    this.textColor = Colors.white,
    this.textFontSize = 16.0,
    this.animated = false,
    this.radius = 10,
    this.margin = const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 16.0),
    this.elevation,
    this.decoration,
  }) : super(key: key);

  final String text;
  final VoidCallback? onPressed;
  final Color color;
  final Color textColor;
  final bool animated;
  final double radius;
  final double textFontSize;
  final EdgeInsets margin;
  final double? elevation;
  final Decoration? decoration;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: margin,
        height: 50.0,
        decoration: decoration,
        width: double.infinity,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation: elevation != null
                ? MaterialStateProperty.resolveWith((states) => elevation)
                : null,
            shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(radius),
                    )),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.grey[500]!;
                else if (states.contains(MaterialState.disabled))
                  return Theme.of(context).primaryColor.withAlpha(100);
                return color;
              },
            ),
          ),
          child: animated
              ? AnimationUtil.circularProgressIndicatorSmall(
                  color: Colors.white,
                )
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: textFontSize,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          onPressed: animated ? null : onPressed,
        ),
      ),
    );
  }
}
