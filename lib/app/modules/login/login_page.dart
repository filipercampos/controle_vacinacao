import 'package:flutter/material.dart';

import 'components/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).accentColor,
              Theme.of(context).primaryColor
            ],
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                child: ClipOval(
                  child: Container(
                    alignment: Alignment.center,
                    child: Image(
                      isAntiAlias: true,
                      image: AssetImage('assets/images/seringa.jpeg'),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: LoginFormWidget(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
