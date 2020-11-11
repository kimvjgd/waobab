import 'package:flutter/material.dart';

class MyWaoBabScreen extends StatefulWidget {
  @override
  _MyWaoBabScreenState createState() => _MyWaoBabScreenState();
}

class _MyWaoBabScreenState extends State<MyWaoBabScreen> {

  double water_width;
  double water_height;

  @override
  Widget build(BuildContext context) {
    double _deviceWidth = MediaQuery.of(context).size.width;
    water_width = _deviceWidth;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text('ddd 님의 와오밥 나',
        style: TextStyle(
          color: Colors.black,
        ),),
      ),
      body: buildTreeBicker(),

    );
    // 여기에 그걸 넣는게 아니네
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
                Container(
                  color: Colors.blue,
                  width: water_width*0.22,
                  height: water_height,
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
            water_height = double.parse(value)*1.07;
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
