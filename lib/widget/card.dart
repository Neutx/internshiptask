// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:internshiptask/model/user.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required User user}) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://picsum.photos/200/300'),
            fit: BoxFit.cover,
            alignment: Alignment(-0.3,0),
          ),
        ),
      );
}
