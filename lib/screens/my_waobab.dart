import 'package:cor_waterstation/screens/invest_person.dart';
import 'package:cor_waterstation/screens/not_invest_person.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

class MyWaobab extends StatelessWidget {
  final per_invest;
  MyWaobab(this.per_invest);


  @override
  Widget build(BuildContext context) {
    print('user_amount_investment : ${user_amount_investment}');
    return per_invest == null ? Center(child: CircularProgressIndicator(),) : Container(
      child:  user_amount_investment == 0  ? NotInvestPerson() : InvestPerson(),
      );
  }
}
