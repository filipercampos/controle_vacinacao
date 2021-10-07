import 'package:controle_vacinacao/app/modules/history/history_controller.dart';
import 'package:controle_vacinacao/app/modules/history/history_tile.dart';
import 'package:controle_vacinacao/app/shared/utils/animation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  final controller = HistoryController();
  @override
  void initState() {
    super.initState();
    controller.fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico Vacinação'),
      ),
      body: Observer(builder: (snapshot) {
        if (controller.loading) {
          return Center(child: AnimationUtil.circularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.vaccines.length,
          itemBuilder: (_, index) {
            return HistoriyTile(controller.vaccines[index]);
          },
        );
      }),
    );
  }
}
