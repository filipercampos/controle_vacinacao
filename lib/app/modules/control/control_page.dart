import 'package:controle_vacinacao/app/modules/control/control_controller.dart';
import 'package:controle_vacinacao/app/shared/components/custom_drawer.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);
  @override
  ControlPageState createState() => ControlPageState();
}

class ControlPageState extends State<ControlPage> {
  final controller = GetIt.I.get<ControlController>();
  @override
  void initState() {
    super.initState();
    controller.register();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Vacinação'),
      ),
      drawer: CustomDrawer(),
       body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(12),
            child: Text(
              'Bem-vindo: ${controller.user.displayName}',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'ControlHeroTag',
        icon: Icon(Icons.qr_code_scanner),
        label: Text('Identificar'),
        onPressed: () {
          navigator.pushQrCode(context);
        },
      ),
    );
  }
}
