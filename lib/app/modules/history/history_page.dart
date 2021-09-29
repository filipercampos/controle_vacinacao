import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);
  @override
  HistoryPageState createState() => HistoryPageState();
}

class HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico'),
      ),
      body: ListView.builder(itemBuilder: (index, _) {
        return ListTile(
          leading: Icon(Icons.details),
          title: Text('Vacina $index'),
          trailing: Icon(Icons.keyboard_arrow_right),
        );
      }),
    );
  }
}
