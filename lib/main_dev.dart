import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'app/app_widget.dart';

void main() async {
  // active binds
  WidgetsFlutterBinding.ensureInitialized();
  // use firebase products
  await Firebase.initializeApp();
  // run app
  runApp(AppWidget());
}
