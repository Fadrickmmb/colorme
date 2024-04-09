import 'package:flutter/material.dart';
import 'instructions.dart';


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: const <Widget>[
              Text(
                "Colorme.",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
            ),
          ]
          ),
          Row(
            children: const <Widget>[
              Text(
                'IMAGE HERE',
            ),
            ]
          ),
          Row(
            children: const <Widget>[
              Text(
              '1st Step'
            ),
            ]
          ),
          Row(
            children: <Widget>[
              ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Instructions()),
                    );
                  },
                child: const Text('Start Now'),
              )
            ],
              )

        ]
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

