import 'dart:io';

import 'package:armopdc3/states/authen.dart';
import 'package:armopdc3/states/my_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Map<String, WidgetBuilder> map = {
  '/authen': (context) => const Authen(),
  '/myservice': (context) => const MyService(),
};

String? firstState;

Future<void> main() async {
  
  HttpOverrides.global = MyHttpOverride();
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preference = await SharedPreferences.getInstance();
  var result = preference.getStringList('data');
  print('result = $result');

  if (result == null) {
    firstState = '/authen';
    runApp(MyApp());
  } else {
    firstState = '/myservice';
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      routes: map,
      initialRoute: firstState,
    );
  }
}

class MyHttpOverride extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback = (cert, host, port) => true;
  }
}
