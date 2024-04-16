import 'package:colorme/chooseColors.dart';
import 'package:flutter/material.dart';

class SecondStep extends StatelessWidget {
  const SecondStep({Key? key}) : super(key: key);

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
                      top: 50.0,
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
              Expanded(
                flex: 10,
                  child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/2ndStep.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 100,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(
                  top: 25.0,
                ),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ChooseColors()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      backgroundColor: Colors.blueAccent
                  ),

                  child: const Text(
                    'Start Now',
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
