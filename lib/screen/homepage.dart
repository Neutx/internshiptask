// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/provicer.dart';
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
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.blueAccent,
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              stops: [0.7, 1]
          ),
                  ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: [
                    buildLogo(),
                    Expanded(child: buildCards(),),
                    SizedBox(height: 16),
                    buildButtons(),
                  ],
                ),
            ),

          ),
        ),
      );

  Widget buildCards() {
    final provider = Provider.of<CardProvider>(context);
    final urlImages = provider.urlImages;

    return Stack(
      children: urlImages
          .map((urlImage) => CustomCard(
          urlImage: urlImage,
          isFront: urlImages.last == urlImages,
      ))
          .toList(),
    );
  }

  Widget buildButtons() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(onPressed: (){}, child: Icon(Icons.clear,color: Colors.red,size: 40,),),
      ElevatedButton(onPressed: (){}, child: Icon(Icons.star,color: Colors.blue,size: 50,)),
      ElevatedButton(onPressed: (){}, child: Icon(Icons.favorite,color: Colors.teal,size: 40,)),
    ],
  );


  Widget buildLogo() => Row(
    children: [
      Icon(
        Icons.local_fire_department_rounded,
        color: Colors.red,
        size: 36,
      ),
      Text('Tinder',style: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.bold,
      ),)
    ],
  );


}