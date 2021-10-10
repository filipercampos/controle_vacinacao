import 'package:controle_vacinacao/app/modules/control/pages/found_user/found_user_page.dart';
import 'package:controle_vacinacao/app/modules/start/pages/user_qrcode/user_qrcode_page.dart';
import 'package:controle_vacinacao/app/pages/success_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants/app_pages.dart';

class AppController {
  ///Replace page
  void pushLogin(context) {
    Navigator.of(context).pushReplacementNamed(AppPages.LOGIN);
  }

  ///Replace page and go to home
  void pushStart(context) {
    Navigator.of(context).pushReplacementNamed(AppPages.START);
  }

  void pushHome(context, {bool replace = false}) {
    if (replace)
      Navigator.of(context).pushReplacementNamed(AppPages.HOME);
    else
      Navigator.of(context).pushNamed(AppPages.HOME);
  }

  void pushAdmin(context) {
    Navigator.of(context).pushNamed(AppPages.ADMIN);
  }

  void pushControl(context) {
    Navigator.of(context).pushNamed(AppPages.CONTROL);
  }

  void pushOperator(context) {
    Navigator.of(context).pushNamed(AppPages.OPERATOR);
  }

  void pushVaccine(context) {
    Navigator.of(context).pushReplacementNamed(AppPages.VACCINE);
  }

  void pushHistory(context) {
    Navigator.of(context).pushNamed(AppPages.HISTORY);
  }

  Future<void> pushProfile(context) async {
    await Navigator.of(context).pushNamed(AppPages.PROFILE);
  }

  Future<void> pushUserQrCode(context) async {
    await Navigator.of(context, rootNavigator: true).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const UserQrCodePage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  Future<void> pushFoundUserAnimation(context) async {
    await Navigator.of(context, rootNavigator: true).pushReplacement(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const FoundUserPage(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    ));
  }

  void pushSignup(context) {
    Navigator.of(context).pushNamed(AppPages.SIGNUP);
  }

  void pushQrCode(BuildContext context) {
    Navigator.of(context).pushNamed(AppPages.QRCODE);
  }

  void pushSuccess(
    context, {
    required String routeBack,
    required String message,
  }) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => SuccessScreen(
          message: message,
          routeBack: routeBack,
        ),
      ),
    );
  }

  void push(context, String route, {bool replace = false}) {
    if (replace)
      Navigator.of(context).pushReplacementNamed(route);
    else
      Navigator.of(context).pushNamed(route);
  }

  void popUntil(context, String route) {
    //modular pega sempre a rota principal (entao ele voltaria pro start)
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(AppPages.START),
    );
  }
}
