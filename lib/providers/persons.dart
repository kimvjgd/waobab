import 'package:cor_waterstation/providers/person.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Persons with ChangeNotifier {
  List<Person> _personsList = [];
  final profileList = FirebaseFirestore.instance.collection('person');
  DocumentSnapshot snapshot;

  List<Person> get persons {
    return [..._personsList];
  }

  Person findByEmail(String email) {
    return _personsList.firstWhere((per) => per.email == email);
  }

  // Future<Persons> fetchAndSetPersons () async {       // 분명 잘못 되었따.
  //
  // }

  Future<void> getUserList() async {
    final data =await profileList.doc('person').get();
    snapshot = data;
  }


  Future<void> addPerson(Person person) async {
    await profileList.add({
      'email': person.email,
      'name': person.name,
      'phone': person.phone,
      'description': person.description,
      'invest_amount': 0,
      'recover_amount': 0,
      'water_percent': 0,
      "fruit": 0,
    });
    try {
      final newPerson = Person(
          name: person.name,
          email: person.email,
          phone: person.phone,
          description: person.description,
          invest_amount: 0,
          recover_amount: 0,
          water_percent: 0,
          fruit: 0,
      );
      _personsList.add(newPerson);
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }
}