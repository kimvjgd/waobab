import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {

  String before1;
  String before2;
  String after1;
  String after2;
  String after3;
  String after4;
  String after5;
  String after6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('before_after')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              var items = snapshot.data.docs ?? [];

              before1 = items[0]['before1'];
              before2 = items[0]['before2'];
              after1 = items[0]['after1'];
              after2 = items[0]['after2'];
              after3 = items[0]['after3'];
              after4 = items[0]['after4'];
              after5 = items[0]['after5'];
              after6 = items[0]['after6'];




              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '시공 전',
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.start,
                  ),
                  Row(
                    children: [
                  Expanded(child: _buildNetworkImage(before1)),
                  Expanded(child: _buildNetworkImage(before2)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    '시공 후',
                    style: TextStyle(fontSize: 20),
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildNetworkImage(after1)),
                      SizedBox(
                        width: 1,
                      ),
                      Expanded(child: _buildNetworkImage(after2)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildNetworkImage(after3)),
                      SizedBox(
                        width: 1,
                      ),
                      Expanded(child: _buildNetworkImage(after4)),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(child: _buildNetworkImage(after5)),
                      SizedBox(
                        width: 1,
                      ),
                      Expanded(child: _buildNetworkImage(after6)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              );
            }
          }),
    );
  }
}

Widget _buildImage(String assetName, double image_width, double image_height) {
  return Align(
    child: Image.asset(
      'images/$assetName.png',
      width: image_width,
      height: image_height,
    ),
    alignment: Alignment.bottomCenter,
  );
}

Widget _buildNetworkImage(String url) {
  return Container(
      child: Image.network(
    url,
    width: 300,
  ));
}

// Image.network('https://picsum.photos/250?image=9')
