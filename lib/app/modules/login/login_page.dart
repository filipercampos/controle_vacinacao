import 'package:flutter/material.dart';

import 'components/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
              Container(
                padding: EdgeInsets.only(bottom: 40.0),
                child: Image(
                  image: AssetImage('assets/images/login.png'),
                  width: mediaQuery.size.width * 0.5,
                  height: mediaQuery.size.width * 0.5,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 16,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: LoginFormWidget(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
