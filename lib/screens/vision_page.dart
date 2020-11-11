import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VisionPage extends StatefulWidget {
  @override
  _VisionPageState createState() => _VisionPageState();
}

class _VisionPageState extends State<VisionPage> {
  String videoURL_2019 = 'https://www.youtube.com/watch?v=05mmspbCwTo';
  YoutubePlayerController _controller_2019;

  @override
  void initState() {
    _controller_2019 = YoutubePlayerController(
        initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2019),
        flags: YoutubePlayerFlags(autoPlay: false));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text('와오밥 나무는,'),
              Align(
                child: Image.asset(
                  'images/vision_1.png',
                  scale: 0.7,
                ),
              ),
              SizedBox(height: 20,),
              Align(
                child: Image.asset(
                  'images/vision_2.png',
                  scale: 0.7,
                ),
              ),
              SizedBox(height: 40,),
              Align(
                child: Image.asset(
                  'images/vision_3.png',
                  scale: 0.7,
                ),
              ),
              SizedBox(height: 20),
              Text('으로 심어질 것이며\n\n우리나라의 뉴스에 가뭄피해 관련 기사가 나오지 않는 날까지 심어질 것입니다.'),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildImage(String assetName, double height, double width) {
  double height;
  double width;
  return align(assetName, height, width);
}

Align align(String assetName, double height, double width) {
  return Align(
    child: Image.asset(
      'images/$assetName.png',
    ),
    alignment: Alignment.bottomCenter,
  );
}
