import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pick_color/pick_color.dart';
import 'result.dart';
import 'package:curved_text/curved_text.dart';

class ChooseEyes extends StatefulWidget {
  final File photo;
  final String skinHex;
  final Color skinColor;
  final String hairHex;
  final Color hairColor;
  const ChooseEyes({Key? key, required this.photo, required this.skinHex, required this.skinColor, required this.hairHex, required this.hairColor}) : super(key: key);

  @override
  State<ChooseEyes> createState() => _ChooseEyesState();
}

class _ChooseEyesState extends State<ChooseEyes> {
  Color eyeColor = Colors.white;
  String buttonHex = "#047FC6";
  String placeholderColor = '#D9D9D9';
  PickerResponse? userResponse;
  late String eyeHex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 1.6,
            child: ColorPicker(
                showMarker: false,
                onChanged: (response){
                  setState(() {
                    userResponse = response;
                    eyeColor = response.selectionColor;
                    eyeHex = response.hexCode;
                  });
                },
                child: Image.file(
                  widget.photo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                )
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  RichText(
                    text: TextSpan(
                        style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                        ),
                        children: <TextSpan>[
                          const TextSpan(
                              text: "Select your "
                          ),
                          TextSpan(
                            text: "Eye Color",
                            style: TextStyle(
                              foreground: Paint()..style = PaintingStyle.fill,
                            ),
                          ),
                        ]
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  Text(
                    "Touch the screen to select it",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'LeagueSpartan',
                      fontWeight: FontWeight.w400,
                      foreground: Paint()..style = PaintingStyle.fill,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 25.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CurvedText(
                    curvature: 0.016,
                    text: "Selected Eye Color",
                    textStyle: TextStyle(
                      fontSize: 17,
                      fontFamily: 'LeagueSpartan',
                      fontWeight: FontWeight.w800,
                      foreground: Paint()..style = PaintingStyle.fill,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: userResponse?.selectionColor ?? Color(int.parse(placeholderColor.substring(1, 7), radix: 16) + 0xFF000000),
                      //border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Result(
                          skinHex: widget.skinHex,
                          hairHex: widget.hairHex,
                          eyeHex: eyeHex
                      )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(int.parse(buttonHex.substring(1, 7), radix: 16) + 0xFF000000),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  child:
                  const Text(
                    "Next",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }
}
