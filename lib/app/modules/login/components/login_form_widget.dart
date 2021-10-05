import 'package:controle_vacinacao/app/modules/login/components/login_button.dart';
import 'package:controle_vacinacao/app/modules/login/components/text_form_field_cpf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../login_controller.dart';
import 'custom_icon_button_widget.dart';
import 'text_field_password.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final controller = GetIt.I<LoginController>();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (BuildContext context) {
        return Form(
          key: controller.formKey,
          child: Column(
            children: <Widget>[
              TextFormFieldCpf(
                hint: 'Usuário',
                inputFormatters: [controller.maskCpf],
                initialValue: controller.username,
                prefix: Icon(Icons.account_circle),
                textInputType: TextInputType.number,
                onChanged: controller.setUserName,
                enabled: !controller.loading,
                inputAction: TextInputAction.next,
              ),
              TextFieldPassword(
                hint: 'Senha',
                initialValue: controller.password,
                prefix: Icon(Icons.lock),
                obscure: !controller.passwordVisible,
                textInputType: TextInputType.text,
                onChanged: controller.setPassword,
                enabled: !controller.loading,
                inputAction: TextInputAction.done,
                suffix: CustomIconButton(
                  radius: 32,
                  iconData: controller.passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                  onTap: controller.tooglePasswordVisibility,
                ),
              ),
              LoginButton()
            ],
          ),
        );
      },
    );
  }
}
