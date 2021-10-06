import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({Key? key}) : super(key: key);
  @override
  ControlPageState createState() => ControlPageState();
}

class ControlPageState extends State<ControlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controle Vacinação'),
      ),
      body: Column(
        children: <Widget>[],
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text('Cadastar Vacina'),
        onPressed: () {
          navigator.pushVaccine(context);
        },
      ),
    );
  }
}
