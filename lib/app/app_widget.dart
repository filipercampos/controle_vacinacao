import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart'; 

import 'constants/app_colors.dart';
import 'constants/app_pages.dart';
import 'modules/base/base_controller.dart';
import 'modules/base/base_page.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_page.dart';
 

class AppWidget extends StatefulWidget {
  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  void initState() {
    super.initState();
    //Register Singleton
    final getIt = GetIt.instance;
    getIt.registerSingleton(BaseController());
    getIt.registerSingleton(LoginController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sistema de Vacinação Digital',
      initialRoute: '/start',
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        textTheme: TextTheme(
          subtitle1: TextStyle(fontSize: 14),
          headline1: TextStyle(fontSize: 14),
          headline6: TextStyle(fontSize: 14),
          bodyText1: TextStyle(fontSize: 14),
          bodyText2: TextStyle(fontSize: 14),
        ),
      ),
      routes: {
        AppPages.START: (ctx) => BasePage(),
        AppPages.LOGIN: (ctx) => LoginPage(),
      },
    );
  }
}
