import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/shared/utils/animation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import 'history_controller.dart';
import 'history_tile.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  final controller = GetIt.I.get<HistoryController>();
  @override
  void initState() {
    super.initState();
    controller.fetchHistory();
  }

  Future<void> _refresh() async {
    controller.vaccines.clear();
    await controller.fetchHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico Vacinação'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: Observer(builder: (snapshot) {
          if (controller.loading) {
            return Center(child: AnimationUtil.circularProgressIndicator());
          }
          if (controller.vaccines.length == 0) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sentiment_very_dissatisfied,
                    size: 48,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sem Registros',
                      style: TextStyle(
                        color: subtitleColor,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return ListView.builder(
            itemCount: controller.vaccines.length,
            itemBuilder: (_, index) {
              return HistoriyTile(controller.vaccines[index]);
            },
          );
        }),
      ),
    );
  }
}
