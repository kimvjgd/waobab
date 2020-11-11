import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 60,),
          Text(
            '시공 전',
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.start,
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Expanded(child: _buildImage('project_1', 300, 150)),
                // 여기의 height가 간격을 좌우한다.
                Expanded(child: _buildImage('project_2', 300, 150)),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '시공 후',
            style: TextStyle(fontSize: 20),
          ),
          SingleChildScrollView(
            child: Row(
              children: [
                Expanded(child: _buildImage('blacksheet', 300, 150)),
                SizedBox(
                  width: 1,
                ),
                Expanded(child: _buildImage('blacksheet', 300, 150))
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
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
