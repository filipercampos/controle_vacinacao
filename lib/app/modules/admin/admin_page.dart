import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'admin_controller.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);
  @override
  AdminPageState createState() => AdminPageState();
}

class AdminPageState extends State<AdminPage> {
  final controller = GetIt.I.get<AdminController>();
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
          backgroundColor: primaryColor,
          foregroundColor: Colors.white,
          onPressed: () {
            //TODO cadastrar operador
          },
          label: Text('Cadastrar Operador'),
        ));
  }
}
