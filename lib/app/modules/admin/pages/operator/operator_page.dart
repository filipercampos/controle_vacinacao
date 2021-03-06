import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/shared/components/date_picker_widget.dart';
import 'package:controle_vacinacao/app/shared/components/input_form_field_border.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:controle_vacinacao/app/shared/utils/animation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'operator_controller.dart';

class AddOperatorPage extends StatefulWidget {
  const AddOperatorPage({Key? key}) : super(key: key);
  @override
  AddOperatorPageState createState() => AddOperatorPageState();
}

class AddOperatorPageState extends State<AddOperatorPage> {
  final controller = GetIt.I.get<OperatorController>();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Operador'),
      ),
      body: Form(
        key: controller.formKey,
        child: Observer(builder: (_) {
          if (controller.loading) {
            return Center(child: AnimationUtil.circularProgressIndicator());
          }
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: <Widget>[
                InputFormFieldBorder(
                  hintText: 'Nome completo',
                  onChanged: controller.setName,
                  validator: controller.validateName,
                ),
                SizedBox(height: 8),
                InputFormFieldBorder(
                  hintText: 'CPF',
                  onChanged: controller.setCpf,
                  validator: controller.validateCpf,
                  inputFormatters: [controller.maskCpf],
                ),
                SizedBox(height: 8),
                InputFormFieldBorder(
                  hintText: 'Email',
                  onChanged: controller.setEmail,
                  validator: controller.validateEmail,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(height: 8),
                DatePickerWidget(
                  usePrefixIcon: true,
                  controller: controller.birthDateController,
                  onDate: controller.setBirthDate,
                  labelText: 'Data Nascimento',
                  hintText: 'Data Nascimento',
                  validator: controller.validateBirthDate,
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: Observer(builder: (_) {
        if (controller.loading) return Container(height: 0, width: 0);
        return FloatingActionButton.extended(
          onPressed: () {
            final scafMesseger = ScaffoldMessenger.of(context);
            if (controller.validate()) {
              controller.saveOperator().then(
                (_) {
                  navigator.pushSuccess(
                    context,
                    routeBack: AppPages.ADMIN,
                    message: 'Operador cadastrado com sucesso\n\n' +
                        'Anote sua senha: ${controller.password}',
                  );
                },
              ).catchError((error) {
                scafMesseger.removeCurrentSnackBar();
                scafMesseger.showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: errorColor,
                    duration: const Duration(seconds: 7),
                    content: Text(controller.errorMessage),
                  ),
                );
              });
            }
          },
          label: Text('Salvar'),
        );
      }),
    );
  }
}
