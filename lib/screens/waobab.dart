import 'package:cor_waterstation/screens/investment_account.dart';
import 'package:cor_waterstation/screens_from_waobab/harvest_screen.dart';
import 'package:cor_waterstation/screens_from_waobab/map_screen.dart';
import 'package:cor_waterstation/screens_from_waobab/mywaobab_screen.dart';
import 'package:cor_waterstation/screens_from_waobab/not_invest_person.dart';
import 'package:cor_waterstation/screens_from_waobab/photo_screen.dart';
import 'package:cor_waterstation/screens_from_waobab/storage_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:core';

class ProjectPage_New extends StatefulWidget {
  @override
  _ProjectPage_NewState createState() => _ProjectPage_NewState();
}

class _ProjectPage_NewState extends State<ProjectPage_New> {

  double water_width;
  double water_height;

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
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    water_width = _deviceWidth;
    const String toLaunch =
        'http://www.weather.go.kr/weather/forecast/digital_forecast.jsp?x=49&y=109&unit=K';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 0, right: 12, left: 12, bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('"첫번째" 와오밥 나무',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            FlatButton(
                                color: Colors.blueGrey,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              NotInvestPerson()));
                                },
                                child: Text('나의 와오밥 보기')),
                            Text('위치 : 충청남도 태안군 소원면 영전 1리\n'
                                '최대 저장량 : 160톤\n'
                                '기간 : 2020년 12월 1일부터')
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blueGrey, width: 3),
                                ),
                                width: 120,
                                height: 40,
                                child: FlatButton(
                                  color: Colors.lightGreen,
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
                              _buildClickBox(
                                  title: '저장량 / 달성치',
                                  color: Colors.yellow,
                                  function: (context) => StorageScreen()),
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
                                  title: '수확 보기',
                                  color: Colors.pinkAccent,
                                  function: (context) => HarvestScreen()),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 100,),
                // Bicker_Widget().buildTreeBicker(),        // Bicker bicker로 나중에 한번 해보자
                buildTreeBicker(),
              ],
            ),

            SizedBox(height: 10,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildPriceBox(),
                _buildPriceBox(),
                _buildPriceBox(),
                _buildPriceBox(),
                _buildPriceBox(),
                _buildPriceBox(),
                _buildPriceBox(),
                _buildPriceBox(),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    '원',
                    style: TextStyle(fontSize: 30),
                  ),
                )
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
        border: Border.all(color: Colors.blueGrey, width: 3),
      ),
      width: 120,
      height: 40,
      child: FlatButton(
        color: color,
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

  Container _buildPriceBox() {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
      ),
      child: Text(
        '1',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }


  Widget buildTreeBicker() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Transform.scale(
          scale: 1.7,
          child: Center(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Image.asset('images/bicker.png',
                  width: water_width*0.5,),
                Column(
                  children: [
                    Container(
                      color: Colors.blue,
                      width: water_width*0.22,
                      height: water_height,
                    ),
                    SizedBox(height: water_width*0.007,),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 100),
        TextField(
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
          onChanged: (value) {
            water_height = double.parse(value)*water_width*0.00287;
          },
        ),
        FlatButton(
            onPressed: () {
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              width: 60,
              height: 60,
              color: Colors.yellow,
              child: Text('click'),
            ))
      ],
    );
  }
}
