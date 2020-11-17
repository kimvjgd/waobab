import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens/invest_person.dart';
import 'package:cor_waterstation/screens/not_invest_person.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _List_Length;
  int per_index;
  List _per_list;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('ddd'),
      // body: StreamBuilder(
      //   stream: FirebaseFirestore.instance.collection('person').snapshots(),
      //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(child: CircularProgressIndicator());
      //     } else {
      //       var items = snapshot.data.docs ?? [];
      //       _per_list = items;
      //       for(int i=0; i<_List_Length; i++) {
      //         if(items[i]['email']==email) {
      //           per_index = i;
      //         }
      //       }
      //       print(items[per_index]['invest_amount']);
      //       // return items[per_index]['invest_amount'] == 0 ? NotInvestPerson() : InvestPerson();
      //       return Text('ddd');
      //     }
      //   },
      // ),
    );
  }
}

