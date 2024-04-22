import 'package:flutter/material.dart';
import 'dart:io';

class ChooseColors extends StatefulWidget {
  final File photo;
  const ChooseColors({Key? key, required this.photo}) : super(key: key);
  @override
  State<ChooseColors> createState() => _ChooseColorsState();
}

class _ChooseColorsState extends State<ChooseColors> {
  Color hairColor = Colors.white;
  Color eyesColor = Colors.white;
  Color skinColor = Colors.white;

  void selectColor(String colorName) {
    setState(() {
      hairColor = colorName == 'hair' ? Colors.grey : Colors.white;
      eyesColor = colorName == 'eyes' ? Colors.grey : Colors.white;
      skinColor = colorName == 'skin' ? Colors.grey : Colors.white;
    });
  }

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
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Image.file(
                widget.photo,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
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
                "Choose the color you want to catch",
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w400,
                  foreground: Paint()..style = PaintingStyle.fill,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              buildColorOption('hair', hairColor),
              buildColorOption('eyes', eyesColor),
              buildColorOption('skin', skinColor),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildColorOption(String colorName, Color color) {
    return GestureDetector(
      onTap: () {
        selectColor(colorName);
      },
      child: Column(
        children: [
          Text(colorName.capitalizeFirst()),
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: color,
              border: Border.all(color: Colors.black, width: 1),
              shape: BoxShape.circle,
            ),
          ),
        ],
      ),
    );
  }
}

extension StringExtension on String {
  String capitalizeFirst() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}
