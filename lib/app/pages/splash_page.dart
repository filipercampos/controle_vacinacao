import 'package:controle_vacinacao/app/modules/login/login_controller.dart';
import 'package:controle_vacinacao/app/modules/start/start_controller.dart';
import 'package:controle_vacinacao/app/shared/enums/auth_status.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
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
    return Scaffold(
      backgroundColor: Colors.lightBlue[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(16),
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage('assets/images/splash2.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 32),
        alignment: Alignment.center,
        height: 60,
        child: Text(
          'Ministério da Saúde',
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Future<void> _startApp() async {
    Future.delayed(Duration(seconds: 1)).then(
      (_) {
        //define and start module
        final route = GetIt.I.get<StartController>().initialModule;
        Navigator.of(context).pushReplacementNamed(route);
      },
    );
  }
}
