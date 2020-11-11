import 'package:cor_waterstation/providers/person.dart';
import 'package:flutter/material.dart';

class Persons with ChangeNotifier {
  List<Person> _persons = [];
  
  List<Person> get persons {
    return [..._persons];
  }
  
  Person findByEmail(String email) {
    return _persons.firstWhere((per) => per.email == email);
  }
  
}