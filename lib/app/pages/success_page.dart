import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/modules/start/start_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    this.title = 'Mensagem',
    this.message = 'Sucesso',
    this.backToHome = true,
    this.routeBack,
    Key? key,
  }) : super(key: key);
  final String title;
  final String message;
  final bool backToHome;
  final String? routeBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
        leading: Container(),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).popUntil(
              ModalRoute.withName(routeBack ?? AppPages.START),
            );
            if (backToHome && routeBack == null) {
              GetIt.I.get<StartController>().goHome();
            }
          },
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Icon(
                  Icons.check_circle,
                  size: 72,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16.0),
                child: Text('Toque para continuar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
