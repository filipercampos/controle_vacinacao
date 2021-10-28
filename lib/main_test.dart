import 'package:controle_vacinacao/app/modules/control/repositories/vaccine_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

//As requisicoes gratuitas sao limitadas
//Insere 100 vacinas
//Apaga 100 vacinas

void main() async {
  // active binds
  WidgetsFlutterBinding.ensureInitialized();
  // use firebase products
  await Firebase.initializeApp();
  runApp(VacccineTest());
}

class VacccineTest extends StatefulWidget {
  const VacccineTest({Key? key}) : super(key: key);

  @override
  _VacccineTestState createState() => _VacccineTestState();
}

class _VacccineTestState extends State<VacccineTest> {
  Future _test() async {
    final vacRep = VaccineRepository();
    final count = 100;
    //clona uma vacina
    final v = await vacRep.getById('DaIFmmpKTDkuJv7UwXDO');
    for (var i = 0; i < count; i++) {
      //salva a vacina
      final id = await vacRep.save(v!.toJson());
      //apaga a vacina
      await vacRep.delete(id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FutureBuilder(
          future: _test(),
          builder: (context, snapshot) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Test'),
                  Text('Insert'),
                  Text('Delete'),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
