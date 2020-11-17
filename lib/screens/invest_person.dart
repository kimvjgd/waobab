import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class InvestPerson extends StatefulWidget {
  @override
  _InvestPersonState createState() => _InvestPersonState();
}

class _InvestPersonState extends State<InvestPerson> {

  int _myWaterPercent;
  int totalWaterPercent = 100;
  double water_height;

  @override
  Widget build(BuildContext context) {
    double water_width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('person').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: Column(children: [
              Text('총 집수량과 투작액 확인은\n',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,),
              Text('로그인 후',style: TextStyle(fontSize: 30,color: Colors.red),textAlign: TextAlign.center,),
              Text('이용 가능합니다.',style: TextStyle(fontSize: 30),textAlign: TextAlign.center,)
            ],));
          } else {
            var items = snapshot.data.docs ?? [];
            int itemsLength = items.length;
            int index;

            // 이 뒤부터
            // water_height = double.parse(items[0]['storage']/items[0]['max']*100) * water_width * 0.00287;
            for(int i=0; i<itemsLength; i++) {
              if(items[i]['email'] == email){
                index = i;
                print(index);
              }
            }
            _myWaterPercent = items[index]['water_percent'];
            print('water_percent : ${_myWaterPercent}');
            water_height = (_myWaterPercent/totalWaterPercent)*water_width*0.282.toDouble();


            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Transform.scale(
                  scale: 1.7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
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
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 100),
                Text('${_myWaterPercent} %',
                style: TextStyle(fontSize: 40),),
              ],
            );
          }
        },
      ),
    );
  }
}
