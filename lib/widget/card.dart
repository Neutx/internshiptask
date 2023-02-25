// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internshiptask/model/user.dart';
import 'package:provider/provider.dart';

import '../model/provicer.dart';

class CustomCard extends StatefulWidget {
  final String urlImage;
  final bool isFront;


  const CustomCard({
    Key? key,
    required this.urlImage,
    required this.isFront
  }) : super(key: key);

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
     final size = MediaQuery.of(context).size;

     final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
      });
  }


  @override
  Widget build(BuildContext context) => SizedBox(
    child: widget.isFront ? buildFrontCard() : buidlCard(),
  );

    Widget buildFrontCard() => GestureDetector(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final provider = Provider.of<CardProvider>(context);
          final position = provider.position;
          final milliseconds = provider.isDragging ? 0 : 400;

          final center = constraints.smallest.center(Offset.zero);
          final angle = provider.angle * pi /180;
          final rotatedMatrix = Matrix4.identity()
            ..translate(center.dx, center.dy)
            ..rotateZ(angle)
            ..translate(-center.dx, -center.dy);

          return AnimatedContainer(
            curve: Curves.easeOut,
              duration: Duration(milliseconds: milliseconds),
              transform: rotatedMatrix
              ..translate(position.dx, position.dy),
              child: buidlCard(),);
        }
      ),
      onPanStart: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.startPosition(details);
      },
      onPanUpdate: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.updatePosition(details);
      },
      onPanEnd: (details) {
        final provider = Provider.of<CardProvider>(context, listen: false);
        provider.endPosition();
      },

    );




  Widget buidlCard() =>ClipRRect(
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.urlImage),
          fit: BoxFit.cover,
          alignment: Alignment(-0.3, 0),
        ),
      ),
      child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.7, 1]),
          ),
          padding: EdgeInsets.all(20),
          child: Container(
            child: Column(
              children: [
                Spacer(),
                // buildName(),
                buildStatus(),
              ],
            ),
          )),
    ),
  );



  // Widget buildName() => Row(
  //       children: [
  //         Text(
  //           widget.user.name,
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 32,
  //             fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         const SizedBox(width: 8),
  //         Text(
  //           '${widget.user.age}',
  //           style: TextStyle(
  //             color: Colors.white,
  //             fontSize: 32,
  //           ),
  //         ),
  //       ],
  //     );

  Widget buildStatus() => Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green,
            ),
            width: 12,
            height: 12,
          ),
          SizedBox(width: 8),
          Text(
            'Recently Active',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ],
      );
}
