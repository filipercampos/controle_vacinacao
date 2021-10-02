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
    Navigator.of(context).pushNamed(AppPages.START);
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
    Navigator.of(context).pushNamed(AppPages.VACCINE);
  }

  void pushHistory(context) {
    Navigator.of(context).pushNamed(AppPages.HISTORY);
  }

  void pushProfile(context) {
    Navigator.of(context).pushNamed(AppPages.PROFILE);
  }

  void pushSignup(context) {
    Navigator.of(context).pushNamed(AppPages.SIGNUP);
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

  void popUntil(context, String route) {
    //modular pega sempre a rota principal (entao ele voltaria pro start)
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(AppPages.START),
    );
  }
}
