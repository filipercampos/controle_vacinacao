import 'package:controle_vacinacao/app/modules/start/pages/user_qrcode/user_qrcode_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app_controller.dart';
import 'constants/app_colors.dart';
import 'constants/app_pages.dart';
import 'modules/admin/admin_controller.dart';
import 'modules/admin/admin_page.dart';
import 'modules/admin/pages/operator/add_operator_page.dart';
import 'modules/control/control_controller.dart';
import 'modules/control/control_page.dart';
import 'modules/control/pages/found_user/found_user_page.dart';
import 'modules/control/pages/qrcode/qrcode_controller.dart';
import 'modules/control/pages/qrcode/qrcode_page.dart';
import 'modules/control/pages/vaccine/vaccine_controller.dart';
import 'modules/control/pages/vaccine/vaccine_page.dart';
import 'modules/login/login_controller.dart';
import 'modules/login/login_page.dart';
import 'modules/signup/signup_page.dart';
import 'modules/start/pages/history/history_page.dart';
import 'modules/start/pages/profile/profile_page.dart';
import 'modules/start/start_controller.dart';
import 'modules/start/start_page.dart';
import 'pages/splash_page.dart';
import 'shared/repositories/auth_repository.dart';

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
    getIt.registerSingleton(AdminController());
    getIt.registerSingleton(ControlController());
    GetIt.I.registerSingleton(VaccineController());
    GetIt.I.registerSingleton(QrCodeController());
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
        AppPages.START: (ctx) => StartPage(),
        AppPages.LOGIN: (ctx) => LoginPage(),
        AppPages.SIGNUP: (ctx) => SignupPage(),
        AppPages.HISTORY: (ctx) => HistoryPage(),
        AppPages.ADMIN: (ctx) => AdminPage(),
        AppPages.CONTROL: (ctx) => ControlPage(),
        AppPages.PROFILE: (ctx) => ProfilePage(),
        AppPages.OPERATOR: (ctx) => OperatorPage(),
        AppPages.VACCINE: (ctx) => VaccinePage(),
        AppPages.QRCODE: (ctx) => QrCodePage(),
        AppPages.USER_QRCODE: (ctx) => UserQrCodePage(),
        AppPages.FOUND_USER: (ctx) => FoundUserPage(),
      },
    );
  }
}
