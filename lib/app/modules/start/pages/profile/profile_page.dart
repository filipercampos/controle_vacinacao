import 'package:controle_vacinacao/app/shared/components/input_form_field.dart';
import 'package:controle_vacinacao/app/shared/global/app_navigator.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'profile_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  final auth = GetIt.I.get<AuthRepository>();
  final controller = GetIt.I.get<ProfileController>();

  final _scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  @override
  Widget build(BuildContext context) {
    final user = controller.user;
    return ScaffoldMessenger(
      key: _scaffoldMessengerKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meu Dados'),
        ),
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              SizedBox(height: 10),
              InputFormField(
                hintText: "Nome",
                autocorrect: true,
                initialValue: user.name,
                readOnly: true,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                inputDecoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Nome",
                ),
              ),
              InputFormField(
                hintText: "Email",
                initialValue: user.email,
                readOnly: true,
                textInputType: TextInputType.emailAddress,
                inputDecoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "Nome",
                ),
              ),
              InputFormField(
                hintText: 'CPF',
                initialValue: user.cpf,
                readOnly: true,
                textInputType: TextInputType.number,
                inputDecoration: InputDecoration(
                  border: InputBorder.none,
                  labelText: "CPF",
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 50,
          alignment: Alignment.bottomLeft,
          margin: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.0,
                color: Colors.grey.shade300,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            dense: true,
            title: Text(
              "Sair",
              style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black87,
                fontSize: 13,
              ),
            ),
            leading: Icon(
              Icons.exit_to_app,
              color: Colors.black87,
            ),
            onTap: () {
              //signout
              GetIt.I<AuthRepository>().signOut();
              navigator.pushLogin(context);
            },
          ),
        ),
      ),
    );
  }
}
