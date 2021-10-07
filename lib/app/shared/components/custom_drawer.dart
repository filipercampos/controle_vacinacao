import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:controle_vacinacao/app/shared/repositories/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.65,
      child: Stack(
        children: [
          Drawer(
            child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  child: Row(
                    children: [
                      Flexible(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: Text(
                            'Controle de Vacinação',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        child: CircleAvatar(
                          radius: 50,
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
                      ),
                    ],
                  ),
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
                ),

                // PageSection()
              ],
            ),
          ),
          //botão sair
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.65,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    width: 1.0,
                    color: Colors.grey.shade300,
                  ),
                ),
              ),
              margin: EdgeInsets.only(top: 8.0, bottom: 16.0),
              child: ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
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
                  Navigator.of(context).pushReplacementNamed(AppPages.LOGIN);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
