import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationUtil {
  static Widget circularProgressIndicatorContext(BuildContext context) {
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
    );
  }

  static circularProgressIndicatorSmall({Color color = primaryColor}) {
    return Container(
      color: Colors.transparent,
      height: 24,
      width: 24,
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }

  static Widget circularProgressIndicator(
      {Color color = primaryColor, bool center = false}) {
    if (center) {
      return Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.transparent,
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
      );
    }
    return CircularProgressIndicator(
      backgroundColor: Colors.transparent,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    );
  }

  static Widget linearProgressIndicator(
      {BuildContext? context, Color color = Colors.white}) {
    return LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        context != null ? Theme.of(context).primaryColor : color,
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
