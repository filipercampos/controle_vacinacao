import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:flutter/material.dart';

class SigninText extends StatelessWidget {
  final bool login;
  final Function()? onTap;
  const SigninText({
    Key? key,
    this.login = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            login ? "Não tem possui uma conta ?" : "Já possui uma conta ? ",
            style:
                TextStyle(color: login ? kPrimaryLightColor : kPrimaryColor),
          ),
          GestureDetector(
            onTap: () => navigator.pushSignup(context),
            child: Center(
              child: Text(
                login ? "Cadastre-se" : "Entrar",
                style: TextStyle(
                  color: login ? kPrimaryLightColor : kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
