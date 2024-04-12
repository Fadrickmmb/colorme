import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:io';

class TakeSelfie extends StatefulWidget {
  const TakeSelfie({Key? key}) : super(key: key);

  @override
  State<TakeSelfie> createState() => _TakeSelfieState();
}

class _TakeSelfieState extends State<TakeSelfie> {
  late List<CameraDescription> cameras;
  CameraController? _controller;
  late File? _takenPhoto;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> initCamera() async {
    try{
      cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      await _controller!.initialize();
      setState(() {});
    } catch(e){
      print('Error initializing camera: $e');
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: CameraPreview(_controller!),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: (){
                    setState(() {

                    });
                  },
                icon: Icon(Icons.switch_camera),
              ),
              ElevatedButton(
                  onPressed: () async{
                    try {
                      XFile photo = await _controller!.takePicture();
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DisplayPhotoScreen(photo: File(photo.path)),
                          ),
                      );
                    } catch (e){
                      print(e);
                    }
                  },
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20.0),
                  backgroundColor: Colors.deepOrange,
                ),
                child: Icon(Icons.camera_alt),
              ),
            ],
          ),
        ],
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
          Image.file(photo),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                child: Text('Retake'),
              ),
              ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                child: Text('Use Photo'),
              ),
            ],
          )
        ],
      ),
    );
  }
}



