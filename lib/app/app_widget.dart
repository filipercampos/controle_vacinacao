import 'package:controle_vacinacao/app/modules/admin/admin_page.dart';
import 'package:controle_vacinacao/app/modules/admin/pages/operator/operator_page.dart';
import 'package:controle_vacinacao/app/modules/control/pages/vaccine/vaccine_page.dart';
import 'package:controle_vacinacao/app/modules/history/history_page.dart';
import 'package:controle_vacinacao/app/modules/profile/profile_page.dart';
import 'package:controle_vacinacao/app/modules/signup/signup_page.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app_controller.dart';
import 'constants/app_colors.dart';
import 'constants/app_pages.dart';
import 'modules/admin/admin_controller.dart';
import 'modules/control/control_controller.dart';
import 'modules/control/pages/read_code/read_code_page.dart';
import 'modules/profile/profile_controller.dart';
import 'modules/start/start_controller.dart';
import 'modules/start/start_page.dart';
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
    getIt.registerSingleton(StartController());
    getIt.registerSingleton(LoginController());
    getIt.registerSingleton(HomeController());
    getIt.registerSingleton(AdminController());
    getIt.registerSingleton(ProfileController());
    getIt.registerSingleton(ControlController());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SCV Digital',
      initialRoute: AppPages.INIT,
      theme: ThemeData(
        primaryColor: primaryColor,
        accentColor: accentColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          textTheme: TextTheme(
            headline6: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: primaryColor,
          disabledColor: accentColor,
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
        AppPages.ADMIN: (ctx) => AdminPage(),
        AppPages.PROFILE: (ctx) => ProfilePage(),
        AppPages.OPERATOR: (ctx) => OperatorPage(),
        AppPages.VACCINE: (ctx) => VaccinePage(),
        AppPages.QRCODE: (ctx) => ReadCodePage(),
        AppPages.SIGNUP: (ctx) => SignupPage(),
      },
    );
  }
}
