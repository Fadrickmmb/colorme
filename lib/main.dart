import 'package:flutter/material.dart';
import 'instructions.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
              Expanded(
                  flex: 10,
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20.0
                    ),
                    alignment: Alignment.center,
                    height: 350,

                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/takeSelfie.png',
                        fit: BoxFit.fitWidth,
                      ) ,
                    )
                  )
              ),
            ]
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: 100,
                margin: const EdgeInsets.only(
                  top: 50.0,
                ),
                child: RichText(
                  text: TextSpan(
                    text: '1st Step\n',
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
                          text: 'Take a Selfie',
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
            height: 15,
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
                      MaterialPageRoute(builder: (context) => Instructions()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      backgroundColor: Colors.deepOrange
                  ),

                  child: const Text(
                    'Take Selfie',
                    style: TextStyle(
                        fontSize: 25,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ],
              ),
        ]
      ),
    );
  }
}


