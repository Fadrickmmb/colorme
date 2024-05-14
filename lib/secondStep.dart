import 'dart:io';
import 'package:colorme/chooseColors.dart';
import 'package:flutter/material.dart';

class SecondStep extends StatelessWidget {
  final File photo;
  final String buttonHex = "#047FC6";
  const SecondStep({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 17,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "colorme.",
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 10,
                  child: Align(
                    //alignment: Alignment.center,
                    child: Image.asset(
                      'assets/2ndStep.png',
                      fit: BoxFit.fitWidth,
                      height: MediaQuery.of(context).size.height / 1.6,
                      width: MediaQuery.of(context).size.width / 1,
                    ),
                  ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 8,
                  margin: const EdgeInsets.only(
                    top: 1.0,
                  ),
                  child: RichText(
                    text: TextSpan(
                        text: '2nd Step\n',
                        style: TextStyle(
                            fontSize: 35,
                            fontFamily: 'LeagueSpartan',
                            fontWeight: FontWeight.w700,
                            foreground: Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 1
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Select colors',
                              style: TextStyle(
                                  fontSize: 50,
                                  foreground: Paint()
                                    ..style = PaintingStyle.fill
                              )
                          ),
                        ]
                    ),

                  ),
                ),
              ]
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 45,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChooseColors(photo: photo)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      backgroundColor: Color(int.parse(buttonHex.substring(1, 7), radix: 16) + 0xFF000000),
                  ),

                  child: const Text(
                    'Start Now',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
