import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cor_waterstation/providers/measurement.dart';
import 'package:flutter/material.dart';

class Measurements with ChangeNotifier {
  List<Measurement> _measurementsList = [];
  final profileList = FirebaseFirestore.instance.collection('measurement');

  List<Measurement> get measurementsList {
    return [..._measurementsList];
  }

  Future<void> getMeasurementList() async {
    final List<Measurement> loadedPersons = [];
    final data = await profileList.get().then(
          (snapshot) => snapshot.docs.forEach(
            (element) {
              loadedPersons.add(
                Measurement(
                  achievement: element['achievement'],
                  max: element['max'],
                  storage: element['storage'],
                  total_invest: element['total_invest'],
                ),
              );
            },
          ),
        );
    _measurementsList = loadedPersons;
  }
}
