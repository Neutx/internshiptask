import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user.dart';
import '../widget/card.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final user = User(
    name: 'John',
    age: 30,
    urlImage: 'https://picsum.photos/200/300',
  );
  @override
  Widget build(BuildContext context) =>
      Scaffold(
        // backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  SizedBox(height: 16),
                  CustomCard(user: user,
                  ),
                ],
              )
          ),

        ),
      );
}