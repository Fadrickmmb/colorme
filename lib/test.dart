import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:video_player/video_player.dart';


class BackgroundVideo extends StatefulWidget {
  const BackgroundVideo({super.key});

  @override
  _BackgroundVideoState createState() => _BackgroundVideoState();
}

class _BackgroundVideoState extends State<BackgroundVideo> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('assets/video3.mp4')
      ..initialize().then((_) {
        _controller.play();
        _controller.setLooping(true);
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox.expand(
      child: FittedBox(
        fit: BoxFit.cover,
        child: SizedBox(
          width: _controller.value.size.width,
          height: _controller.value.size.height,
          child: VideoPlayer(_controller),
        ),
      ),
    )
        : Container();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}


class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);
  final String gradient1 = '#35A1F4';
  final String gradient2 = '#77DF8E';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: <Widget>[
          const BackgroundVideo(),
          Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "colorme.",
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Finding your colors",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'LeagueSpartan',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LoadingAnimationWidget.prograssiveDots(
                            color: Colors.white,
                            size: 100
                        ),
                      ]
                  ),
                  SizedBox(
                    height: 280,
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
                    height: 40,
                  ),
                ],
              )
          ),
        ],
      ),
    );
  }
}
