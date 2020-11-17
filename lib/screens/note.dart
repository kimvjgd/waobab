import 'package:flutter/material.dart';
import 'dart:math';

class Note extends StatelessWidget {

  var a = 30;
  var b = 4;
  int c = 0;
  var d = pow(3,2);
  int total_invest = 123456789;
  int temp;

  @override
  Widget build(BuildContext context) {
    //        '${(total_invest/temp ~/ 10) % 10}',

    for(int i=0; i<=8; i++) {
      temp = pow(10,i);
      print('${(total_invest ~/ temp) % 10}');
    }


    return Center(
      child: Container(
        child: Text('$c',
        style: TextStyle(fontSize: 50),),
      ),
    );
  }

}
