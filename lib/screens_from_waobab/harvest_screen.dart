import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HarvestScreen extends StatefulWidget {
  @override
  _HarvestScreenState createState() => _HarvestScreenState();
}

class _HarvestScreenState extends State<HarvestScreen> {
  String harvest1;
  String harvest2;
  String harvest3;
  String harvest4;
  String harvest5;
  String harvest6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('harvest').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            var items = snapshot.data.docs ?? [];
              harvest1 = items[0]['har1'];
              harvest2 = items[0]['har2'];
              harvest3 = items[0]['har3'];
              harvest4 = items[0]['har4'];
              harvest5 = items[0]['har5'];
              harvest6 = items[0]['har6'];




            return Column(
              children: [
                Row(
                  children: [
                    Expanded(child: _buildNetworkImage(harvest1)),
                    Expanded(child: _buildNetworkImage(harvest2)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildNetworkImage(harvest3)),
                    Expanded(child: _buildNetworkImage(harvest4)),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: _buildNetworkImage(harvest5)),
                    Expanded(child: _buildNetworkImage(harvest6)),
                  ],
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

Widget _buildNetworkImage(String url) {
  return Container(
      child: Image.network(
        url,
        width: 300,
      ));
}
