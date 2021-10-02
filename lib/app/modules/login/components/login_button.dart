import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/constants/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../login_controller.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = GetIt.I<LoginController>();
    final scafMesseger = ScaffoldMessenger.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: controller.loading || !controller.isFormValid
              ? null
              : () {
                  if (controller.validate()) {
                    controller.login().then(
                      (_) {
                        Navigator.of(context).pushNamed(AppPages.START);
                      },
                    ).catchError((error) {
                      scafMesseger.removeCurrentSnackBar();
                      scafMesseger.showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: errorColor,
                          duration: const Duration(seconds: 4),
                          content: Text(controller.errorMessage),
                        ),
                      );
                    });
                  }
                },
          style: ButtonStyle(
            shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed))
                  return Colors.grey;
                else if (states.contains(MaterialState.disabled))
                  return Theme.of(context).accentColor.withAlpha(200);
                return Colors.purple; // Use the component's default.
              },
            ),
          ),
          //or symple style
          // style: ElevatedButton.styleFrom(
          //   // disabledColor:
          //   onSurface: Theme.of(context).primaryColor.withAlpha(100),
          //   primary: Theme.of(context).primaryColor,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(25),
          //   ),
          //   textStyle: TextStyle(color: Colors.white),
          // ),
          child: controller.loading
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                )
              : Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
