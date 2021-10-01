import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/modules/login/components/text_form_field_cpf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../login_controller.dart';
import 'custom_icon_button_widget.dart';
import 'text_field_login.dart';

class LoginFormWidget extends StatefulWidget {
  @override
  _LoginFormWidgetState createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final controller = GetIt.I<LoginController>();
  final _formKey = GlobalKey<FormState>();
  final maskCNPJ = MaskTextInputFormatter(
      mask: "###.###.###-##", filter: {"#": RegExp(r'[0-9]')});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scafMesseger = ScaffoldMessenger.of(context);
    return Observer(
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormFieldCpf(
                hint: 'Usuário',
                inputFormatters: [maskCNPJ],
                initialValue: controller.cpf,
                prefix: Icon(Icons.account_circle),
                textInputType: TextInputType.number,
                onChanged: controller.setCpf,
                enabled: !controller.loading,
                inputAction: TextInputAction.next,
              ),
              TextFieldLogin(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.resolveWith(
                          (states) => RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              )),
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed))
                            return Colors.grey;
                          else if (states.contains(MaterialState.disabled))
                            return Theme.of(context).accentColor.withAlpha(100);
                          return Colors.purple; // Use the component's default.
                        },
                      ),
                    ),
                    //or symple style
                    // style: ElevatedButton.styleFrom(
                    //   // disabledColor:
                    //   onSurface: Theme.of(context).primaryColor.withAlpha(100),
                    //   primary: Theme.of(context).primaryColor,
                    //   shape: RoundedRectangleBorder(
                    //     borderRadius: BorderRadius.circular(25),
                    //   ),
                    //   textStyle: TextStyle(color: Colors.white),
                    // ),
                    child: controller.loading
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          )
                        : Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                    onPressed: controller.loading
                        ? null
                        : () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate() &&
                                controller.isPasswordValid &&
                                !controller.loading) {
                              controller.login().then(
                                (_) {
                                  if (controller.errorMessage.isEmpty) {
                                    Navigator.of(context)
                                        .pushNamed(AppPages.START);
                                  } else {
                                    scafMesseger.removeCurrentSnackBar();
                                    scafMesseger.showSnackBar(
                                      SnackBar(
                                        behavior: SnackBarBehavior.floating,
                                        backgroundColor: errorColor,
                                        duration: const Duration(seconds: 4),
                                        content:
                                            Text(controller.errorMessage),
                                      ),
                                    );
                                  }
                                },
                              );
                            }
                          },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
