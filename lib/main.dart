import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:band_names/pages/home.dart';
import 'package:band_names/pages/status.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Band Names App',
      initialRoute: 'status',
      routes: {
        'home': (context) => HomePage(),
        'status': (context) => StatusPage(),
      },
    );
  }
}
