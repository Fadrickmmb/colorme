import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorme/takeSelfie.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class Instructions extends StatefulWidget {
  Instructions({Key? key}) : super(key: key);

  @override
  State<Instructions> createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  int _currentIndex = 0;

  final List<String> imagePaths = [
    "assets/Instruction01.png",
    "assets/Instruction02.png",
    "assets/Instruction03.png"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Text(
              "colorme.",
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'LeagueSpartan',
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 35),
            Text(
              "Instructions",
              style: TextStyle(
                fontSize: 37,
                fontFamily: 'LeagueSpartan',
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 20),
            CarouselSlider.builder(
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                height: 300,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 2),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagePaths.map((url) {
                int index = imagePaths.indexOf(url);
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.black : Colors.grey.shade400,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const TakeSelfie()),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  backgroundColor: Colors.deepOrange
              ),
              child: const Text('Take Selfie'),
            ),
            Expanded(
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Positioned.fill(
                      child: Image.asset(
                        "assets/Instruction.png",

                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



void main() {
  runApp(Instructions());
}
