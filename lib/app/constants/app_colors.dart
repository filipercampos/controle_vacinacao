import 'package:flutter/material.dart';

///Colors App
const Color primaryColor = const Color(0xFF27B2FD);
const Color primaryColorDark = const Color(0xFF1A2F44);
const Color primaryColorLight = const Color(0xFF27B2FD);

const Color goldenColor = const Color(0xFFFFCB0B);
const Color lightColor = const Color(0xFFFFFFFF);

final Color accentColor = const Color(0xFFCCCCCC);
final Color accentColorDark = Colors.grey[800]!;
final Color accentColorLight = Colors.grey[200]!;
final Color subtitleColor = Colors.grey[600]!;
final Color greyAccent = Colors.grey[500]!;
const Color tealColor = const Color.fromARGB(255, 4, 125, 141);

final Color highlightColor = Colors.grey[500]!;
final Color cursorColor = Colors.grey[700]!;

final Color backgroundColor = Colors.white;
final Color errorColor = Colors.red[500]!;
final Color errorColorDark = Colors.red[800]!;
final Color errorColorLight = Colors.red;

final Color redColor = Colors.red[700]!;

final Color disableColor = Colors.grey[700]!.withAlpha(50);
//End Color App

//Snackbar/Toast colors
final Color successColor = Colors.green[800]!;
const Color successColorLight = Colors.green;
final Color successColorDark = Colors.green[900]!;
final Color greenColor = Colors.green;

final Color warningColor = Colors.yellow[800]!;
final Color warningLightColor = Colors.yellow[700]!;
final Color warningDarkColor = Colors.yellow[900]!;

//End Snackbar colors

const LinearGradient primaryGradientColor = LinearGradient(
  // Where the linear gradient begins and ends
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  // Add one stop for each color. Stops should increase from 0 to 1
  stops: [0.0, 1.0],
  colors: [
    // Color.fromRGBO(170, 207, 211, 1.0),
    // Color.fromRGBO(93, 142, 155, 1.0),
    primaryColorDark,
    primaryColor,
  ],
);
const MaterialColor materialSwatchColor = const MaterialColor(
  0xFF000000,
  const <int, Color>{
    50: const Color(0xFF4A5BF6),
    100: const Color(0xFF4A5BF6),
    200: const Color(0xFF4A5BF6),
    300: const Color(0xFF4A5BF6),
    400: const Color(0xFF4A5BF6),
    500: const Color(0xFF4A5BF6),
    600: const Color(0xFF4A5BF6),
    700: const Color(0xFF4A5BF6),
    800: const Color(0xFF4A5BF6),
    900: const Color(0xFF4A5BF6),
  },
);
final defaultButtonStyle = ButtonStyle(
  backgroundColor: MaterialStateProperty.resolveWith<Color>(
    (Set<MaterialState> states) {
      if (states.contains(MaterialState.pressed))
        return Colors.blue;
      else if (states.contains(MaterialState.disabled))
        return primaryColor.withAlpha(100);
      // Use the component's default.
      return primaryColor;
    },
  ),
);

const MaterialColor swatchColor = const MaterialColor(
  0xFF000000,
  const <int, Color>{
    50: const Color(0xFF1A2F44),
    100: const Color(0xFF1A2F44),
    200: const Color(0xFF1A2F44),
    300: const Color(0xFF1A2F44),
    400: const Color(0xFF1A2F44),
    500: const Color(0xFF1A2F44),
    600: const Color(0xFF1A2F44),
    700: const Color(0xFF1A2F44),
    800: const Color(0xFF1A2F44),
    900: const Color(0xFF1A2F44),
  },
);
const kPrimaryColor = Color(0xFF1A2F44);
const kPrimaryLightColor = Color(0xFFEEEEEE); //grey light
// const kPrimaryColor = Color(0xFF6F35A5);
// const kPrimaryLightColor = Color(0xFFF1E6FF);
const kBackgroundColor = const Color(0xFFF2F2F2);
const kBrandGrey = const Color(0xFFF6F5F5);
const kBrandDarkGrey = const Color(0xFFA6A29F);
const kBrandDarkerGrey = const Color(0xFF3F3E3E);
const kBrandDarkenGrey = const Color(0xFFA6A29F);
const kGrey = const Color(0xffF0F1F5);
const kGrey2 = const Color(0xffC4C6CC);
