import 'package:flutter/material.dart';

class VaccinePage extends StatefulWidget {
  const VaccinePage({Key? key}) : super(key: key);
  @override
  VaccinePageState createState() => VaccinePageState();
}
class VaccinePageState extends State<VaccinePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Vacina'),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}