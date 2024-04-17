import 'package:flutter/material.dart';
import 'dart:io';

class ChooseColors extends StatefulWidget {
  final File photo;
  const ChooseColors({Key? key, required this.photo}) : super(key: key);
  @override
  State<ChooseColors> createState() => _ChooseColorsState();
}

class _ChooseColorsState extends State<ChooseColors> {
  double circle1X = 0;
  double circle1Y = 0;
  double circle2X = 0;
  double circle2Y = 0;
  double circle3X = 0;
  double circle3Y = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.file(
                    widget.photo,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
                Positioned(
                  left: circle1X - 10,
                  top: circle1Y - 10,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        circle1X += details.delta.dx;
                        circle1Y += details.delta.dy;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: circle2X - 10,
                  top: circle2Y - 10,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        circle2X += details.delta.dx;
                        circle2Y += details.delta.dy;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: circle3X - 10,
                  top: circle3Y - 10,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      setState(() {
                        circle3X += details.delta.dx;
                        circle3Y += details.delta.dy;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: circle1X - 30,
                  top: circle1Y - 40,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.0),
                    child: const Text(
                      "Hair",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: circle2X - 30,
                  top: circle2Y - 40,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.0),
                    child: const Text(
                      "Eyes",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: circle3X - 30,
                  top: circle3Y - 40,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    color: Colors.black.withOpacity(0.0),
                    child: const Text(
                      "Skin",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Instructions\n",
                style: TextStyle(
                  fontSize: 37,
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w700,
                  foreground: Paint()..style = PaintingStyle.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Move the circles to catch the colors",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w400,
                  foreground: Paint()..style = PaintingStyle.fill,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black, width: 1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black, width: 1),
                  shape: BoxShape.circle,
                ),
              ),
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black, width: 1),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
