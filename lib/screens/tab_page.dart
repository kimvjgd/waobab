import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens/invest_person.dart';
import 'package:cor_waterstation/screens/my_page.dart';
import 'package:cor_waterstation/screens/my_waobab.dart';
import 'package:cor_waterstation/screens/not_invest_person.dart';
import 'package:cor_waterstation/screens/vision_page.dart';
import 'package:cor_waterstation/screens/waobab.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'introduction_page.dart';




class TabPage extends StatefulWidget {

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  // Person _person;
  int _selectedIndex = 0;
  List _pages;
  String person_name;         // TabPage의 person name이다.
  String per_phone;
  int per_invest=0;
  int per_index;
  int per_percent;
  int per_fruit;
  String per_email;

  @override
  void initState() {
    super.initState();

    _pages = [
      IntroductionPage(),
      VisionPage(),
      ProjectPage_New(),
      // user_amount_investment == 0 ? NotInvestPerson() : InvestPerson(),
      MyWaobab(per_invest),
    ];
  }



  @override
  Widget build(BuildContext context) {
    // _person = Provider.of<Persons>(context, listen:false).findByEmail(email);

    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Center(
          child: _pages[_selectedIndex],
        ),
        bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.black,
          onTap: _onItemTapped,

          currentIndex: _selectedIndex,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(
                  Icons.location_city,
                  color: Colors.black,
                ),
                title: Text('Introduction')),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.trending_up, color: Colors.black),
                title: Text('Vision')),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.wysiwyg, color: Colors.black),
                title: Text('WaoBab')),
            BottomNavigationBarItem(
                backgroundColor: Colors.white,
                icon: Icon(Icons.attribution_outlined, color: Colors.black),
                title: Text('My waobab')),
          ],
        ),
      ),
    );
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildAppBar() {
      return AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        actions: [
          FlatButton(
            color: Colors.white,
            onPressed: () {
              person_name = null;
              per_phone = null;
              per_percent =0;
              per_fruit = 0;
              per_invest = 0;
              per_email = '';
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            }, child: _buildcolumn(),
          ),
        ],
        title: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('person').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return buildcontainer();
              // 아마 비회원으로 들어오면 여기가 계속 돌아갈 것이다. 나중에 고쳐줄것
            } else {
              var items =
              snapshot.data.docs ?? []; // 내용이 없어도 null이 안되고 []공백이된다..
              for(int i=0; i<items.length; i++) {
                if(items[i]['email'] == email) {
                  per_index = i;
                }
              }

              person_name = index_person == 9999 ? '' : items[per_index]['name'];
              per_invest = index_person == 9999 ? 0 : items[per_index]['invest_amount'];
              per_percent = index_person == 9999 ? 0 : items[per_index]['water_percent'];
              per_fruit = index_person == 9999 ? 0 : items[per_index]['fruit'];
              per_email = index_person == 9999 ? '' : items[per_index]['email'];
              return buildcontainer();
            }
          },
        ),
      );
  }

  Container buildcontainer() {
    if (per_name != '' && email != '') {
      return per_name == null ? Center(child: CircularProgressIndicator(),) : Container(child: Text(
        '\'${person_name} \'님 와오밥나무 : ${per_invest}원 (${per_percent}%)\n                  와오밥열매 : ${per_fruit}',
        style: TextStyle(
            color: Colors.black, fontStyle: FontStyle.italic, fontSize: 14),));
    } else {
      return per_name == null ? Center(child: CircularProgressIndicator(),) : Container(child: Text(
        '\'비 회 원 \' 님 반 갑 습 니 다. \n비회원이시므로 투자 항목 \n열람은 불가합니다. ♪',
        style: TextStyle(
            color: Colors.black, fontStyle: FontStyle.italic, fontSize: 15),));
    }
  }

  Widget _buildcolumn() {
      return Center(child: Icon(Icons.exit_to_app, color: Colors.black,));
  }
}