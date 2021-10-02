import 'package:controle_vacinacao/app/modules/admin/admin_controller.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  final controller = GetIt.I.get<AdminController>();

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
          title: Text('Administrador'),
        ),
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
          icon: Icon(Icons.add),
          label: Text('Operador'),
          onPressed: () {
            //add operator
            navigator.pushOperator(context);
          },
        ));
  }
}
