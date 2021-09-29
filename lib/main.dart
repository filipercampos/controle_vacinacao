import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'app/app_widget.dart';


void main() async {
  // active binds
  WidgetsFlutterBinding.ensureInitialized();
  // use firebase products
  await Firebase.initializeApp();
  // catch all errors
  FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  // debug print deactivated
  debugPrint = (String? message, {int? wrapWidth}) {};
  // run app
  runApp( AppWidget());
}
