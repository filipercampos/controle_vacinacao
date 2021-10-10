import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/shared/components/input_form_field_border.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:controle_vacinacao/app/shared/utils/animation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'vaccine_controller.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({Key? key}) : super(key: key);
  @override
  VaccinePageState createState() => VaccinePageState();
}

class VaccinePageState extends State<VaccinePage> {
  final controller = GetIt.I.get<VaccineController>();

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
          return ListView(
            padding: const EdgeInsets.all(12.0),
            children: <Widget>[
              InputFormFieldBorder(
                autofocus: true,
                autocorrect: true,
                hintText: 'Nome da Doença',
                onChanged: controller.setDisease,
                validator: controller.validateDisease,
                initialValue: controller.disease,
                maxLength: 45,
                textCapitalization: TextCapitalization.characters,
                readOnly: controller.selectedVaccine != null,
              ),
              SizedBox(height: 8),
              InputFormFieldBorder(
                autocorrect: true,
                hintText: 'Nome da Vacina',
                onChanged: controller.setName,
                validator: controller.validateName,
                initialValue: controller.name,
                maxLength: 45,
                textCapitalization: TextCapitalization.characters,
                readOnly: controller.selectedVaccine != null,
              ),
              SizedBox(height: 8),
              InputFormFieldBorder(
                autocorrect: true,
                hintText: 'Dosagem',
                initialValue: controller.dose,
                maxLength: 45,
                textCapitalization: TextCapitalization.characters,
                hideCounterText: true,
                readOnly: true,
              ),
            ],
          );
        }),
      ),
      floatingActionButton: Observer(builder: (_) {
        if (controller.loading) return Container(height: 0, width: 0);
        return FloatingActionButton.extended(
          onPressed: () {
            final scafMesseger = ScaffoldMessenger.of(context);
            if (controller.validate()) {
              controller.saveVaccine().then(
                (_) {
                  navigator.pushSuccess(
                    context,
                    routeBack: AppPages.CONTROL,
                    message: 'Vacina salva com sucesso',
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
