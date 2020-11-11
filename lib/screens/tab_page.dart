import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens/vision_page.dart';
import 'package:cor_waterstation/screens/waobab.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:cor_waterstation/transitory/investment_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'introduction_page.dart';




class TabPage extends StatefulWidget {
  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  int _selectedIndex = 0;
  int num = 0;
  List _pages;

  @override
  void initState() {
    super.initState();


    _pages = [
      IntroductionPage(),
      VisionPage(),
      ProjectPage_New(),
    ];
    
  }


  @override
  Widget build(BuildContext context) {
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

          // 시작을 홈화면으로 하려면 어떻게 해야할까
          // 일단 주어진 틀이 있고 거기에 index도 정해져있으며 어떻게 해야할 지 그것부터 알아야하는ㄴ데.
          // 흠.. 일단 index의 젤 끝으로 두고
          // HomePage를 한번 넣고 그 후는 다시 틀일이 없는데 그렇게 하기 위해서.. 일단 정해진 틀부터 깨야 한다.
          // 일단 bottomNavigationBar를 뜯어 봐야할 듯 한다. 흠

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
    // @@ donstagram clone _ 1  account_page에서 initstate를 참조하면 내꺼만 가져올듯
    if (2 > 1) {
      return AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        actions: [
          FlatButton(
            color: Colors.white,
            onPressed: () {
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WelcomeScreen()));
            },
            child: _buildcolumn(),
          )
        ],
        title: StreamBuilder(
          stream: Firestore.instance.collection('person').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return buildcontainer();
              // 아마 비회원으로 들어오면 여기가 계속 돌아갈 것이다. 나중에 고쳐줄것
            } else {
              var items =
              // ignore: deprecated_member_use
              snapshot.data.documents ?? []; // 내용이 없어도 null이 안되고 []공백이된다..
              List_Length = items.length;
              data_investor = items;

              return buildcontainer();
            }
          },
        ),
      );

      //   return AppBar(
      //     toolbarHeight: 70,
      //     title: SafeArea(
      //       child: Text(
      //         '${person_name}',
      //         style: TextStyle(color: Colors.black, fontSize: 15),
      //       ),
      //     ),
      //     backgroundColor: Colors.white,
      //   );
      // } else if (1 > 2) {
      //   return AppBar(
      //     actions: [
      //       FlatButton(
      //         color: Colors.black,
      //         onPressed: () {
      //           FirebaseAuth.instance.signOut();
      //           _googleSignIn.signOut();
      //           Navigator.push(context,
      //               MaterialPageRoute(builder: (context) => WelcomeScreen()));
      //         },
      //         child: Icon(Icons.ac_unit),
      //       )
      //     ],
      //     toolbarHeight: 70,
      //     //  user.displayNmae이 빈것으로 나온다라..
      //     // title: SafeArea(child: Text('${widget.user.displayName} 님 \n 투자액: ${widget.user.phoneNumber}, 회수액: ${widget.user.email}',style: TextStyle(color: Colors.black,fontSize: 15),),),
      //     backgroundColor: Colors.white,
      //   );
      // }
    }
  }

  Container buildcontainer() {
    if (name != null) {
      return Container(child: Text(
        '\'${name} \' 님 반 갑 습 니 다. ♪\n Welcome  to  WaterStation~♪',
        style: TextStyle(
            color: Colors.black, fontStyle: FontStyle.italic, fontSize: 15),));
    } else {
      return Container(child: Text(
        '\'비 회 원 \' 님 반 갑 습 니 다. ♪\n비회원이시므로 투자 항목 \n열람은 불가합니다. ♪',
        style: TextStyle(
            color: Colors.black, fontStyle: FontStyle.italic, fontSize: 15),));
    }
  }

  Widget _buildcolumn() {
    if(data_investor[index_person]['email']==email) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.exit_to_app, color: Colors.black,),
          Text('Log_Out')
        ],
      );
    } else {
        return Text('로그인 페이지로\n돌아가기');
    }
  }
}