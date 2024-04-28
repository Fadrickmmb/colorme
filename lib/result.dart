import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';


class Result extends StatefulWidget {
  final String skinHex;
  final String hairHex;
  final String eyeHex;

  const Result({
    Key? key,
    required this.skinHex,
    required this.hairHex,
    required this.eyeHex,
  }) : super(key: key);

  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          SizedBox(
            height: 80,
          ),
        ],
      ),
    );
  }
}
