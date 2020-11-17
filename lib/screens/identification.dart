import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/providers/person.dart';
import 'package:cor_waterstation/providers/persons.dart';
import 'package:cor_waterstation/screens/slide_screen.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:cor_waterstation/transitory/rounded_button.dart';
import 'package:provider/provider.dart';

String test = 'test';
  final profileList = FirebaseFirestore.instance.collection('person');

class Identification extends StatefulWidget {

  static const String id = 'registration_screen';

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification> {
  String per_name;
  String per_email= email;
  String per_phone;
  String per_description = '';
  int per_invest_amount=0;
  int per_recover_amount=0;
  int per_water_percent=0;
  int per_fruit=0;


  final _phoneFocusNode = FocusNode();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // var _editedPerson = Person(
  //   name: '',
  //   phone: '',
  //   email: email,
  //   description: '',
  //   invest_amount: 0,
  //   recover_amount: 0,
  //   water_percent: 0,
  //   fruit: 0,
  // );

  @override
  void initState() {
    if(per_name != '') {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SlidePage()));
    }
    super.initState();
  }


  @override
  void dispose() {
    _phoneFocusNode.dispose();
    super.dispose();
  }

  Future<void> _saveForm() async {
    if(per_email != null && per_phone != null) {
      try{
        profileList.add({
          'email': per_email,
          'name': per_name,
          'phone': per_phone,
          'description': per_description,
          'invest_amount': per_invest_amount,
          'recover_amount': per_recover_amount,
          'water_percent': per_water_percent,
          'fruit': per_fruit,           // 나중에 그냥 0으로 고칠 수 있는
        });
      } catch (e) {
        print(e);
      }
    }
    Navigator.push(context, MaterialPageRoute(builder: (context)=> SlidePage()));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(
                    height: 80,
                  ),
                  Hero(
                    tag: 'logo', // welcome_screen의 tag와 같은 이름이여야 한다.
                    child: Container(
                      height: 180.0,
                      child: Image.asset('images/logo.png'),
                    ),
                  ),
                  SizedBox(
                    height: 48.0,
                  ),
                  Text('한번 설정하면 못바꾸니 제발!! 잘 설정해줘요!!!!!!!!! 나중 수정 사항임'),
                  SizedBox(
                    height: 48.0,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.black),
                    cursorColor: Colors.black,
                    decoration: InputDecoration(labelText: 'Name'),
                    textInputAction: TextInputAction.next,
                    onFieldSubmitted: (_) {
                      FocusScope.of(context)
                          .requestFocus(_phoneFocusNode);
                    },
                    validator: (value) {
                      if(value.isEmpty) {
                        return 'Please provide a name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                        per_name = value;
                    },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextFormField(
                    cursorColor: Colors.black,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(labelText: 'Phone #'),
                    textInputAction: TextInputAction.next,
                    focusNode: _phoneFocusNode,
                    validator: (String value) {
                      if(value.isEmpty) {
                        return 'Please provide a phone number';
                      }
                      test = value;
                      return null;
                    },
                    onChanged: (value) {
                        per_phone = value;
                    },
                    // onSaved: (String value) {
                    //   _editedPerson = Person(
                    //     name: _editedPerson.name,
                    //     phone: value,
                    //     email: _editedPerson.email,
                    //     description: _editedPerson.description,
                    //     invest_amount: _editedPerson.invest_amount,
                    //     recover_amount: _editedPerson.recover_amount,
                    //   );
                    // },
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  SizedBox(
                    height: 32.0,
                  ),
                  RoundedButton(
                    title: 'Register',
                    colour: Colors.blue.shade900,
                    onPressed: _saveForm,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }


}