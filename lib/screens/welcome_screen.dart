import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens/identification.dart';
import 'package:cor_waterstation/transitory/investment_page.dart';
import 'package:flutter/material.dart';
import 'package:cor_waterstation/transitory/rounded_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main_page2.dart';

String name, email, phone;
int index_person=0;

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';




  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(accessToken: googleSignInAuthentication.accessToken, idToken: googleSignInAuthentication.idToken);

    final UserCredential userCredential = await _auth.signInWithCredential(authCredential);
    final _user = userCredential.user;
    assert(_user.email != null);
    assert(_user.displayName != null);
    setState(() {
      name = _user.displayName;
      email = _user.email;
      // ignore: deprecated_member_use
    });

    final currentUser = await _auth.currentUser;
    assert(currentUser.uid == _user.uid);

    return 'Logged In';
  }

  @override
  void initState() {
    user.initData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            _buildBody(),
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/logo.png'
                ,scale: 0.5,),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('WaoBab',
                style: TextStyle(fontSize: 60, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20),
            // MaterialButton(
            //   color: Colors.red,
            //   onPressed: () => googleSignIn().whenComplete(() {
            //     user.initData();
            //     if(data_investor[index_person]['email'] == email){
            //       Navigator.pushReplacement(context, MaterialPageRoute(
            //           builder: (context) => MainPage()
            //       ));} else{
            //       Navigator.pushReplacement(context, MaterialPageRoute(
            //           builder: (context) => Identification()
            //       ));
            //     }
            //   }),
            //   child: Text('Google Login',
            //   style: TextStyle(fontSize: 17, color: Colors.white),),
            // ),

            RoundedButton(title: 'Google Login', colour:Colors.red ,
              onPressed: () => googleSignIn().whenComplete(() {
                user.initData();
                if(data_investor[index_person]['email'] == email){
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => MainPage()
                  ));} else{
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Identification()
                  ));
                }
              }),
            ),

            RoundedButton(title: '비회원 로그인', colour:Colors.blue , onPressed: () {
              name = null;
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MainPage()));
            },),


            SizedBox(
              height: 28.0,
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildBody() {
    return StreamBuilder(
      stream: Firestore.instance.collection('person').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        total_investment=0;
        if (!snapshot.hasData) {
          return Column();
        } else {
          var items =
              snapshot.data.documents ?? []; // 내용이 없어도 null이 안되고 []공백이된다..
          List_Length = items.length;
          data_investor = items;
          return Text(' ');
        }
      }, // post밑에 파일들이 변경되면 그 흐름이 들어온다.
    );
  }
}

User user = User();

class User {
  List<UserInfo> _userInfo = List<UserInfo>();

  void initData() {
    _userInfo.clear();
    for (int i = 0; i < List_Length; i++) {
      _userInfo.add(UserInfo(
        data_investor[i]['email'],
      ));
      if(data_investor[i]['email']==email) {
        index_person = i;
        print(index_person);
      }
    }
  }

  List<UserInfo> get userInfo => _userInfo;

  set userInfo(List<UserInfo> value) {
    _userInfo = value;
  }
}

class UserInfo {
  String email;
  UserInfo(this.email);
}
