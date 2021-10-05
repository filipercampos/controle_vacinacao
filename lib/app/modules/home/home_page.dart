import 'package:controle_vacinacao/app/shared/components/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final controller = GetIt.I.get<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
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
    );
  }
}
