import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';
import 'secondStep.dart';

class TakeSelfie extends StatefulWidget {
  const TakeSelfie({Key? key}) : super(key: key);

  @override
  State<TakeSelfie> createState() => _TakeSelfieState();
}

class _TakeSelfieState extends State<TakeSelfie> {
  late List<CameraDescription> cameras;
  late Future<void> _initCameraFuture;
  late CameraController _controller;
  int _selectedCameraIndex = 0;

  @override
  void initState() {
    super.initState();
    _initCameraFuture = initCamera();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    try {
      cameras = await availableCameras();
      _controller = CameraController(cameras[_selectedCameraIndex], ResolutionPreset.ultraHigh);
      await _controller.initialize();
      setState(() {});
    } catch (e) {
      print('Error initializing camera: $e');
    }
  }

  void switchCamera() async {
    // Dispose current controller
    await _controller.dispose();

    // Toggle camera index
    _selectedCameraIndex = (_selectedCameraIndex + 1) % cameras.length;

    // Initialize new controller with selected camera
    _controller = CameraController(cameras[_selectedCameraIndex], ResolutionPreset.ultraHigh);
    await _controller.initialize();

    // Update UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<void>(
        future: _initCameraFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_controller.value.isInitialized) {
              return Column(
                children: [
                  Expanded(
                    child: CameraPreview(_controller),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        onPressed: switchCamera, // Call switchCamera function
                        icon: const Icon(Icons.switch_camera),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            XFile photo = await _controller.takePicture();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DisplayPhotoScreen(photo: File(photo.path)),
                              ),
                            );
                          } catch (e) {
                            print(e);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          padding: const EdgeInsets.all(20.0),
                          backgroundColor: Colors.deepOrange,
                        ),
                        child: const Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Error: Camera not available'));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class DisplayPhotoScreen extends StatelessWidget {
  final File photo;
  const DisplayPhotoScreen({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            children: [
              Container(
                margin: const EdgeInsets.only(
                  top: 10,
                ),
                height: MediaQuery.of(context).size.height / 2,
                child: Image.file(
                  photo,
                  fit: BoxFit.fitWidth,
                  width: MediaQuery.of(context).size.width / 1.2,
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    backgroundColor: Colors.orangeAccent,
                  ),
                  child: const Text(
                    'Try Again',
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 20,
              ),
              SizedBox(
                width: 140,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondStep(photo: photo)),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0)
                    ),
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: const Text(
                    'Use Photo',
                    style: TextStyle(
                        fontSize: 19,
                        fontFamily: 'LeagueSpartan',
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
              flex: 10,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Positioned.fill(
                      child: Image.asset("assets/takeSelfie.png"),
                    ),
                  )
                ],
              ),
          ),
        ],
      ),
    );
  }
}
