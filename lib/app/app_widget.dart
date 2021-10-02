import 'package:controle_vacinacao/app/modules/history/history_page.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app_controller.dart';
import 'constants/app_colors.dart';
import 'constants/app_pages.dart';
import 'modules/base/base_controller.dart';
import 'modules/base/base_page.dart';
import 'modules/home/home_controller.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_page.dart';
import 'pages/splash_page.dart';

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
    getIt.registerSingleton(AuthRepository());
    getIt.registerSingleton(AppController());
    getIt.registerSingleton(BaseController());
    getIt.registerSingleton(LoginController(GetIt.I.get<AuthRepository>()));
    getIt.registerSingleton(HomeController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCD Digital',
      initialRoute: AppPages.INIT,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
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
        AppPages.INIT: (ctx) => SplashPage(),
        AppPages.START: (ctx) => BasePage(),
        AppPages.LOGIN: (ctx) => LoginPage(),
        AppPages.HISTORY: (ctx) => HistoryPage(),
      },
    );
  }
}
