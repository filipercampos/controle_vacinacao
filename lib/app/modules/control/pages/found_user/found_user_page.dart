import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/modules/control/pages/qrcode/qrcode_controller.dart';
import 'package:controle_vacinacao/app/modules/control/pages/vaccine/vaccine_controller.dart';
import 'package:controle_vacinacao/app/modules/control/repositories/vaccine_repository.dart';
import 'package:controle_vacinacao/app/modules/start/pages/history/history_tile.dart';
import 'package:controle_vacinacao/app/shared/components/input_form_field.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:controle_vacinacao/app/shared/utils/animation_util.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class FoundUserPage extends StatefulWidget {
  const FoundUserPage({Key? key}) : super(key: key);
  @override
  FoundUserPageState createState() => FoundUserPageState();
}

class FoundUserPageState extends State<FoundUserPage> {
  final controller = GetIt.I.get<QrCodeController>();
  final historyRep = VaccineRepository();
  @override
  Widget build(BuildContext context) {
    if (controller.user == null) {
      return Center(
          child: Text('Ocorreu um erro. Identifique o usuario novamente'));
    }
    final user = controller.user!;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Usuário Identificado',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InputFormField(
                  hintText: "Nome",
                  autocorrect: true,
                  initialValue: user.name,
                  readOnly: true,
                  inputDecoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "Nome",
                  ),
                ),
                InputFormField(
                  hintText: 'CPF',
                  initialValue: user.cpf,
                  readOnly: true,
                  inputDecoration: InputDecoration(
                    border: InputBorder.none,
                    labelText: "CPF",
                  ),
                ),
              ],
            ),
          ),
          FutureBuilder<List<Vaccine>>(
            future: historyRep.getAllByUser(controller.user!.id),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: AnimationUtil.circularProgressIndicator(),
                );
              final vaccines = snapshot.data ?? [];
              return Expanded(
                child: ListView.builder(
                  itemCount: vaccines.length,
                  itemBuilder: (_, index) {
                    return HistoriyTile(
                      vaccines[index],
                      onTap: () {
                        GetIt.I
                            .get<VaccineController>()
                            .setVaccine(vaccines[index]);
                        navigator.pushVaccine(context);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'FoundUserHeroTag',
        icon: Container(
          child: Image.asset(
            'assets/icons/injection.png',
            width: 24,
            height: 24,
            color: Colors.white,
          ),
        ),
        label: Text('Vacinar'),
        onPressed: () {
          navigator.pushVaccine(context);
        },
      ),
    );
  }
}
