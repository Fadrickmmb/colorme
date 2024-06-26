import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorme/takeSelfie.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key? key}) : super(key: key);

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
            SizedBox(
                height: MediaQuery.of(context).size.height / 30
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  "Instructions",
                  style: TextStyle(
                    fontSize: 37,
                    fontFamily: 'LeagueSpartan',
                    fontWeight: FontWeight.w700,
                  ),
                )
              ],
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 80,
            ),
            CarouselSlider.builder(
              itemCount: imagePaths.length,
              itemBuilder: (BuildContext context, int index, int realIndex) {
                return Image.asset(
                  imagePaths[index],
                  fit: BoxFit.cover,
                );
              },
              options: CarouselOptions(
                height: MediaQuery.of(context).size.height / 3.2,
                enableInfiniteScroll: true,
                viewportFraction: 1.0,
                enlargeCenterPage: false,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 800,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: imagePaths.map((url) {
                int index = imagePaths.indexOf(url);
                return Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 2.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index ? Colors.black : Colors.grey.shade400,
                  ),
                );
              }).toList(),
            ),
            SizedBox(
                height: MediaQuery.of(context).size.height / 30,
            ),
            SizedBox(
              width: 180,
              height: 45,
              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TakeSelfie()),
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 50,
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
  runApp(const Instructions());
}
