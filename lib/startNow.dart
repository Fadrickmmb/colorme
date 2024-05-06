import 'package:flutter/material.dart';
import 'main.dart';


class StartNow extends StatelessWidget {
  const StartNow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2.5
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                "colorme.",
                style: TextStyle(
                  fontSize: 70,
                  fontFamily: 'LeagueSpartan',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: 'Powered By ',
                        style: TextStyle(
                          fontFamily: 'LeagueSpartan',
                          fontSize: 21,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                      ),
                      WidgetSpan(
                          child: Image.asset(
                            'assets/gptlogo.png',
                            width: 20,
                            height: 20,
                          ),
                      ),
                    ]
                  ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 3,
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
                      MaterialPageRoute(builder: (context) => MyApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)
                      ),
                      backgroundColor: Colors.black
                  ),

                  child: const Text(
                    'Start Now',
                    style: TextStyle(
                        fontSize: 28,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
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

void main() {
  runApp(const MaterialApp(
    home: StartNow(),
  ));
}
