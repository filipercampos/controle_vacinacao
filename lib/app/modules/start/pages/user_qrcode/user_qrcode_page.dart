import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UserQrCodePage extends StatefulWidget {
  const UserQrCodePage({Key? key}) : super(key: key);
  @override
  UserQrCodePageState createState() => UserQrCodePageState();
}

class UserQrCodePageState extends State<UserQrCodePage> {
  final auth = GetIt.I.get<AuthRepository>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meu QR Code',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(12),
            child: QrImage(
              data: auth.user.civ,
              version: QrVersions.auto,
              size: 300,
            ),
          ),
          Text(auth.user.civ),
        ],
      ),
    );
  }
}
