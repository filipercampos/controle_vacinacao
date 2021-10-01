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

  void pushProfile(context) {
    Navigator.of(context).pushNamed(AppPages.PROFILE);
  }

  void pushSignup(context) {
    Navigator.of(context).pushNamed(AppPages.SIGNUP);
  }

  void pushSuccess(context) {
    Navigator.of(context).popAndPushNamed('');
  }

  void popUntil(context, String route) {
    //modular pega sempre a rota principal (entao ele voltaria pro start)
    Navigator.of(context).pushNamedAndRemoveUntil(
      route,
      ModalRoute.withName(AppPages.START),
    );
  }
}
