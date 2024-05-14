import 'package:flutter/material.dart';
import 'instructions.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height / 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'colorme.',
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
                  child: Container(
                    margin: const EdgeInsets.only(
                        top: 20.0
                    ),
                    alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height / 2.3,

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
            height: MediaQuery.of(context).size.height / 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 8.5,
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
            height: MediaQuery.of(context).size.height / 60,
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
                      MaterialPageRoute(builder: (context) => const Instructions()),
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


