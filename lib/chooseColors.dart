import 'package:flutter/material.dart';
import 'dart:io';

class ChooseColors extends StatefulWidget {
  final File photo;
  const ChooseColors({Key? key, required this.photo}) : super(key: key);
  @override
  State<ChooseColors> createState() => _ChooseColorsState();
}

class _ChooseColorsState extends State<ChooseColors> {
  double circle1X = 0; // X-coordinate of circle 1
  double circle1Y = 0; // Y-coordinate of circle 1
  double circle2X = 0; // X-coordinate of circle 2
  double circle2Y = 0; // Y-coordinate of circle 2
  double circle3X = 0; // X-coordinate of circle 3
  double circle3Y = 0; // Y-coordinate of circle 3

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Stack(
              children: [
                Image.file(
                  widget.photo,
                  fit: BoxFit.cover, // Image takes the entire width of the device
                  width: double.infinity,
                ),
                Positioned(
                  left: circle1X,
                  top: circle1Y,
                  child: _buildDraggableCircle(1),
                ),
                Positioned(
                  left: circle2X,
                  top: circle2Y,
                  child: _buildDraggableCircle(2),
                ),
                Positioned(
                  left: circle3X,
                  top: circle3Y,
                  child: _buildDraggableCircle(3),
                ),
              ],
            ),
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
                    foreground: Paint()..style = PaintingStyle.fill),
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
                    foreground: Paint()..style = PaintingStyle.fill),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDraggableCircle(int circleIndex) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          if (circleIndex == 1) {
            circle1X += details.delta.dx;
            circle1Y += details.delta.dy;
          } else if (circleIndex == 2) {
            circle2X += details.delta.dx;
            circle2Y += details.delta.dy;
          } else if (circleIndex == 3) {
            circle3X += details.delta.dx;
            circle3Y += details.delta.dy;
          }
        });
      },
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1), // Border color and width
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
