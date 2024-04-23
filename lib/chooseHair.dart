import 'package:flutter/material.dart';
import 'dart:io';
import 'package:pick_color/pick_color.dart';
import 'chooseEyes.dart';

class ChooseHair extends StatefulWidget {
  final File photo;
  final String skinHex;
  final Color skinColor;
  const ChooseHair({Key? key, required this.photo, required this.skinHex, required this.skinColor}) : super(key: key);

  @override
  State<ChooseHair> createState() => _ChooseHairState();
}

class _ChooseHairState extends State<ChooseHair> {
  Color hairColor = Colors.white;
  PickerResponse? userResponse;
  late String hairHex;
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
            child: ColorPicker(
                child: Image.file(
                  widget.photo,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                showMarker: false,
                onChanged: (response){
                  setState(() {
                    userResponse = response;
                    hairColor = response.selectionColor;
                    hairHex = response.hexCode;
                  });
                }
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Select your Hair Color\n",
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
                "Touch the screen to select it",
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
            height: 35.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text("Hair Color Selected"),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: userResponse?.selectionColor ?? Colors.red,
                      border: Border.all(color: Colors.black, width: 1),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    "Hex Code:- ${userResponse?.hexCode ??  ''}",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
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
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseEyes(
                          photo: widget.photo,
                          skinColor: widget.skinColor,
                          skinHex: widget.skinHex,
                          hairColor: hairColor,
                          hairHex: hairHex,

                      )),
                    );
                  },
                  child:
                  const Text("Next")
              ),
            ],
          ),
        ],
      ),
    );
  }
}
