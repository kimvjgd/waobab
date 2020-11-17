import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens_from_waobab/harvest_screen.dart';
import 'package:cor_waterstation/screens_from_waobab/map_screen.dart';
import 'package:cor_waterstation/screens/not_invest_person.dart';
import 'package:cor_waterstation/screens_from_waobab/photo_screen.dart';
import 'package:cor_waterstation/screens_from_waobab/storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import 'dart:math';

class ProjectPage_New extends StatefulWidget {
  @override
  _ProjectPage_NewState createState() => _ProjectPage_NewState();
}

class _ProjectPage_NewState extends State<ProjectPage_New> {
  double water_width;
  double water_height;
  int water_variable;
  int total_invest=0;


  Future<void> _launched;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    double _deviceWidth = MediaQuery.of(context).size.width;
    water_width = _deviceWidth;
    const String toLaunch =
        'http://www.weather.go.kr/weather/forecast/digital_forecast.jsp?x=49&y=109&unit=K';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, right: 12, left: 12, bottom: 12),
                  child: Row(
                    children: [
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '"첫번째" 와오밥 나무',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text('위치 : 충청남도 태안군 소원면 영전 1리\n'
                                '최대 저장량 : 100톤\n'
                                '기간 : 2020년 12월 1일부터')
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black, width: 3),
                            ),
                            width: 120,
                            height: 40,
                            child: FlatButton(
                              color: Colors.white,
                              onPressed: () {
                                _launched = _launchInBrowser(toLaunch);
                              },
                              child: Text(
                                '날씨 보기',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          _buildClickBox(
                              title: '사진 보기',
                              color: Colors.deepPurpleAccent,
                              function: (context) => PhotoScreen()),
                          SizedBox(
                            height: 3,
                          ),
                          _buildClickBox(
                              title: '지도 보기',
                              color: Colors.grey,
                              function: (context) => MapScreen()),
                          SizedBox(
                            height: 3,
                          ),
                          _buildClickBox(
                              title: '수확물 보기',
                              color: Colors.pinkAccent,
                              function: (context) => HarvestScreen()),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                // Bicker_Widget().buildTreeBicker(),        // Bicker bicker로 나중에 한번 해보자
                buildMidBody(),
              ],
            ),

            //@@@
          ],
        ),
      ),
    );
  }

  Container _buildClickBox({String title, Color color, Function function}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 3),
      ),
      width: 120,
      height: 40,
      child: FlatButton(
        color: Colors.white,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: function));
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }


  Widget buildMidBody() {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('measurement').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (!snapshot.hasData) {
          return Center(child: Column(children: [
            Text('총 집수량과 투작액 확인은\n',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
            Text('로그인 후',style: TextStyle(fontSize: 30,color: Colors.red),textAlign: TextAlign.center,),
            Text('이용 가능합니다.',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
          ],));
        } else {
          var items = snapshot.data.docs ?? [];
          // 이 뒤부터
          // water_height = double.parse(items[0]['storage']/items[0]['max']*100) * water_width * 0.00287;
          total_invest = items[0]['total_invest'];
          water_height = items[0]['storage']/items[0]['max']*water_width*0.282;


          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: 1.7,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image.asset(
                        'images/bicker.png',
                        width: water_width * 0.5,
                      ),
                      Column(
                        children: [
                          Container(
                            color: Colors.blue,
                            width: water_width * 0.228,
                            height: water_height,
                          ),
                          SizedBox(
                            height: water_width * 0.0019,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildPriceBox(8),
                  _buildPriceBox(7),
                  _buildPriceBox(6),
                  _buildPriceBox(5),
                  _buildPriceBox(4),
                  _buildPriceBox(3),
                  _buildPriceBox(2),
                  _buildPriceBox(1),
                  _buildPriceBox(0),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Text(
                      '원',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ],
          );
        }
      },
    );
  }

  Container _buildPriceBox(int pw) {
    int temp = pow(10, pw);
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        '${(total_invest ~/ temp) % 10}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
