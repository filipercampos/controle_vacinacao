import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/modules/login/login_controller.dart';
import 'package:controle_vacinacao/app/shared/enums/auth_status.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  final controller = GetIt.I.get<LoginController>();
  late ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    //init obscure
    controller.passwordVisible = false;
    //login global
    disposer = reaction((_) => controller.status, (status) {
      if (status == AuthStatus.SUCCESS) {
        Future.delayed(Duration(milliseconds: 300), () {
          navigator.pushHome(context);
        });
      }
    });
    _startApp();
  }

  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Image(
              image: AssetImage('assets/images/splash.jpeg'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _startApp() async {
    Future.delayed(Duration(seconds: 1)).then(
      (_) {
        final auth = GetIt.I.get<AuthRepository>();
        if (auth.isAuth) {
          Navigator.of(context).pushReplacementNamed(AppPages.START);
        } else {
          Navigator.of(context).pushReplacementNamed(AppPages.LOGIN);
        }
      },
    );
  }
}
