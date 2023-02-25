import 'package:flutter/material.dart';
import 'package:internshiptask/screen/homepage.dart';
import 'package:provider/provider.dart';

import 'model/provicer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CardProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.red,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: CircleBorder(),
              minimumSize: Size.square(80)
            ),
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}
