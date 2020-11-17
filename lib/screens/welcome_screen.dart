import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/screens/identification.dart';
import 'package:flutter/material.dart';
import 'package:cor_waterstation/transitory/rounded_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'slide_screen.dart';

String name, email, phone;
String per_name;
int index_person = 9999;
int _List_Length;
List data_list;
int user_amount_investment;


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

    setState(() {
      email = _user.email;
      // ignore: deprecated_member_use
    });
    return 'Logged In';
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
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('person').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Column();
                } else {
                  var items =
                      snapshot.data.docs ?? []; // 내용이 없어도 null이 안되고 []공백이된다..
                  data_list = items;
                  _List_Length = items.length;
                  for(int i=0; i<_List_Length; i++) {
                    if(items[i]['email'] == email) {
                      index_person = i;
                    }
                  }
                  user_amount_investment = index_person == 9999 ? 0 : items[index_person]['invest_amount'];
                  per_name = index_person == 9999 ? '' : items[index_person]['name'];
                  return Column();
                }
              }, // post밑에 파일들이 변경되면 그 흐름이 들어온다.
            ),
            Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset('images/main_logo.png'
                  ,scale: 1.4,),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('WAOBAB',
                  style: TextStyle(fontSize: 50, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 30),


            RoundedButton(title: 'Google Login', colour:Colors.red ,
              onPressed: () async => await googleSignIn().whenComplete(() {
                print('asdfasdfasdf : ${index_person}');
                print('asdfasdfasdf : ${per_name}');
                if(per_name != ''){      // index_person 하고 data_investor을 모두 고쳐줘야함
                  print('per_name : ${per_name}');
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => SlidePage()
                  ));} else{
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => Identification()
                  ));
                }
              }),
            ),

            RoundedButton(title: '비회원 로그인', colour:Colors.blue , onPressed: () {
              name = '';
              email = '';
              per_name = '';
              FirebaseAuth.instance.signOut();
              _googleSignIn.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (context)=> SlidePage()));
            },),
            SizedBox(
              height: 28.0,
            ),
          ],
        ),
      ),
    );
  }
}
