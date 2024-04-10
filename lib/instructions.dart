import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


List<String> images = [
  "assets/Instruction01.png",
  "assets/Instruction02.png",
  "assets/Instruction03.png",
];

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/Instruction01.png");
  }
}



class Instructions extends StatelessWidget {
  const Instructions({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      top: 100.0
                  ),
                  child: const Text(
                    "colorme.",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: 'LeagueSpartan',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                )]
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(
                      top: 35.0
                  ),
                  child: const Text(
                    "Instructions",
                    style: TextStyle(
                      fontSize: 37,
                      fontFamily: 'LeagueSpartan',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                )]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Test(),
              )
            ],
          )
        ],
      ),
    );


  }
}
