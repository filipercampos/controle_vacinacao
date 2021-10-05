import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/modules/login/components/custom_icon_button_widget.dart';
import 'package:controle_vacinacao/app/shared/components/custom_elevated_button.dart';
import 'package:controle_vacinacao/app/shared/components/input_form_field_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'signup_controller.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final controller = SignupController();
  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Inscrição"),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Observer(builder: (_) {
                    return InputFormFieldBorder(
                      hintText: "Nome",
                      autocorrect: true,
                      onChanged: controller.setName,
                      errorText: controller.nameError,
                      textCapitalization: TextCapitalization.words,
                      textInputAction: TextInputAction.next,
                    );
                  }),
                  SizedBox(height: 10),
                  Observer(builder: (_) {
                    return InputFormFieldBorder(
                      hintText: "Email",
                      onChanged: controller.setEmail,
                      errorText: controller.emailError,
                      textInputType: TextInputType.emailAddress,
                    );
                  }),
                  SizedBox(height: 10),
                  Observer(builder: (_) {
                    return InputFormFieldBorder(
                      hintText: 'CPF',
                      inputFormatters: [controller.maskCpf],
                      textInputType: TextInputType.number,
                      onChanged: controller.setCpf,
                      enabled: !controller.loading,
                      errorText: controller.cpfError,
                    );
                  }),
                  SizedBox(height: 10),
                  Observer(builder: (_) {
                    return InputFormFieldBorder(
                      hintText: 'Senha',
                      initialValue: controller.password,
                      textInputType: TextInputType.text,
                      onChanged: controller.setPassword,
                      enabled: !controller.loading,
                      obscure: controller.passwordVisible,
                      maxLines: 1,
                      errorText: controller.passwordError,
                      textInputAction: TextInputAction.done,
                      suffixIcon: CustomIconButton(
                        onTap: controller.togglePasswordVisibility,
                        radius: 32,
                        iconData: controller.passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    );
                  }),
                ],
              ),
            ),
            Observer(builder: (_) {
              return CustomElevatedButton(
                  text: "Cadastrar",
                  textFontSize: 16,
                  animated: controller.loading,
                  margin: EdgeInsets.fromLTRB(16, 16, 16, 24),
                  onPressed: controller.isFormValid && !controller.loading
                      ? () {
                          controller.signUp().then(
                            (_) {
                              Navigator.of(context).pop();
                              Navigator.of(context)
                                  .pushReplacementNamed(AppPages.START);
                            },
                          ).catchError((error) {
                            _scaffoldMessengerKey.currentState!
                                .removeCurrentSnackBar();
                            _scaffoldMessengerKey.currentState!.showSnackBar(
                              SnackBar(
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: errorColor,
                                duration: const Duration(seconds: 4),
                                content: Text(controller.errorMessage),
                              ),
                            );
                          });
                        }
                      : null);
            }),
          ],
        ),
      ),
    );
  }
}
