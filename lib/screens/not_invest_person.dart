import 'package:cor_waterstation/screens/investment_account.dart';
import 'package:flutter/material.dart';

class NotInvestPerson extends StatefulWidget {
  @override
  _NotInvestPersonState createState() => _NotInvestPersonState();
}

class _NotInvestPersonState extends State<NotInvestPerson> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('아직 와오밥 나무를 안심으셨네요.'
            ,style: TextStyle(
                fontSize: 20
              ),),
            SizedBox(height: 40,),
            _buildClickBox(
                title: '나무 심기',
                color: Colors.yellow,
                function: (context) => InvestmentAccount()),
          ],
        ),
      ),
    );
  }

  Container _buildClickBox({String title, Color color, Function function}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey, width: 3),
      ),
      width: 120,
      height: 40,
      child: FlatButton(
        color: color,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: function));
        },
        child: Text(
          title,
          style: TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}
