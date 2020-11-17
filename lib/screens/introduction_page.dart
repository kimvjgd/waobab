import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class IntroductionPage extends StatefulWidget {
  @override
  _IntroductionPageState createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  String videoURL_2017 = 'https://www.youtube.com/watch?v=lP_Bh6WFwPI&t=37s';
  String videoURL_2018 = 'https://www.youtube.com/watch?v=uqxtWo_ccGg';
  String videoURL_2019 = 'https://www.youtube.com/watch?v=05mmspbCwTo';
  String videoURL_2020 = 'https://www.youtube.com/watch?v=3BVRh4VK2zE';

  YoutubePlayerController _controller_2017;
  YoutubePlayerController _controller_2018;
  YoutubePlayerController _controller_2019;
  YoutubePlayerController _controller_2020;

  @override
  void initState() {
    _controller_2017 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2017),
      flags: YoutubePlayerFlags(
        autoPlay: false)

    );

    _controller_2018 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2018),
        flags: YoutubePlayerFlags(
            autoPlay: false)
    );

    _controller_2019 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2019),
    flags: YoutubePlayerFlags(
    autoPlay: false)
    );

    _controller_2020 = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoURL_2020),
        flags: YoutubePlayerFlags(
            autoPlay: false)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   shadowColor: Colors.grey,
      //   backgroundColor: Colors.white,
      //   automaticallyImplyLeading: false,
      //   title: Text(
      //     'Introduction',
      //     style: TextStyle(
      //         fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      // ),ㅑ
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 20,),
                Text(
                  '2017 년',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2017,
                )),
                SizedBox(height: 20,),
                Text(
                  '2018 년',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2018,
                )),
                SizedBox(height: 20,),
                Text(
                  '2019 년',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2019,
                )),
                SizedBox(height: 20,),
                Text(
                  '2020 년',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 3,),
                Container(
                    child: YoutubePlayer(
                  controller: _controller_2020,
                )),
                SizedBox(height: 80,),
                Text('당신이 심은 와오밥나무 한그루,\n가뭄을 해결할 수 있습니다.',
                  style: TextStyle(fontSize: 17),),
                SizedBox(height: 40,),
                Align(
                  child: Image.asset('images/introduction_1.png',
                  scale: 0.6,),
                ),
                SizedBox(height: 80),
                Text('* 와오밥열매 1개 = 1,000원',
                style: TextStyle(fontSize: 17),),
                Text('예) 10,000원 짜리 와오밥 나무에서는 10개의 와오밥열매가 열립니다..',
                  style: TextStyle(fontSize: 12),),
                SizedBox(height: 10,),
                Text('와오밥열매로 해당 지역에서 수확된 농산물 값싼 가격에 받아 볼 수 있습니다.',
                  style: TextStyle(fontSize: 17),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
