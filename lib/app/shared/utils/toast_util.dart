// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:wee_delivery/app/constants/app_colors.dart';

// ///Toast message
// @Deprecated('Imcomatible with no-safety')
// class ToastUtil {
//   static ToastUtil _instance = ToastUtil._internal();

//   ToastUtil._internal();

//   static ToastUtil get toast => _instance;

//   factory ToastUtil() => toast;

//   ///Show message
//   ///Default position is bottom
//   static Future<void> showToast(
//     String message, {
//     Toast? toastLength,
//     ToastGravity? gravity,
//     int seconds = 4,
//     Color? textColor,
//     Color? backgroundColor,
//     double? fontSize,
//   }) async {
//     await _toastBuilder(
//       message: message,
//       toastLength: toastLength,
//       gravity: gravity,
//       seconds: seconds,
//       textColor: textColor,
//       backgroundColor: backgroundColor,
//       fontSize: fontSize,
//     );
//   }

//   ///Show success message at bottom position
//   static Future<void> showToastSuccess(String message,
//       {int seconds = 3}) async {
//     await _toastBuilder(
//       message: message,
//       seconds: seconds,
//       backgroundColor: successColor,
//     );
//   }

//   ///Show warning message at bottom position
//   static Future<void> showToastWarning(String message,
//       {int seconds = 3}) async {
//     await _toastBuilder(
//       message: message,
//       seconds: seconds,
//       backgroundColor: warningColor,
//     );
//   }

//   ///Show error message at bottom position
//   static Future<void> showToastError(String message, {int seconds = 3}) async {
//     await _toastBuilder(
//       message: message,
//       seconds: seconds,
//       backgroundColor: errorColor,
//     );
//   }

//   static Future<void> _toastBuilder({
//     required String message,
//     Toast? toastLength,
//     ToastGravity? gravity,
//     int? seconds,
//     Color? textColor,
//     Color? backgroundColor,
//     double? fontSize,
//   }) async {
//     await Fluttertoast.showToast(
//       msg: message,
//       toastLength: toastLength ?? Toast.LENGTH_SHORT,
//       gravity: gravity ?? ToastGravity.BOTTOM,
//       timeInSecForIosWeb: seconds ?? 3,
//       backgroundColor: backgroundColor ?? Colors.black.withOpacity(0.80),
//       textColor: textColor ?? Colors.white,
//       fontSize: fontSize ?? 16.0,
//     );
//   }
// }
