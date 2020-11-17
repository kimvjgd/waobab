import 'package:flutter/material.dart';

class InvestmentAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset('images/logo.png',
                width: MediaQuery.of(context).size.width*0.7,),
                padding: EdgeInsets.only(bottom: 10),
              ),
              Text('WAOBAB',
              style: TextStyle(fontSize: 40),),
              SizedBox(height: 40,),
              Text('예금주 : 와오밥\n',
              style: TextStyle(fontSize: 14),),
              Text('거래은행 : 국민은행\n',
              style: TextStyle(fontSize: 14),),
              Text('계좌번호 : 3333-00-@@@@@@@@\n',
              style: TextStyle(fontSize: 14),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('최소 금액은 ',
                  style: TextStyle(fontSize: 14),),
                  Image.asset('images/seed.png',
                  width: 15,
                  height: 15,),
                  Text(' 1개의 가격:1,000원 입니다.',
                    style: TextStyle(fontSize: 14),),
                ],
              ),
              SizedBox(height:10),
              Text('*송금 시 반드시 로그인에 기입한 이름\ngoogle, 또는 휴대폰번호를 기입해주세요.',
              style: TextStyle(fontSize: 11),),
              SizedBox(height:10),

              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('문의'),
                    SizedBox(height: 8,),
                    Text('번호 : 010 - 3090 - 4522'),
                    SizedBox(height: 8,),
                    Text('kakao ID : WAOBAB'),
                    SizedBox(height: 8,),
                    Text('Email : WAOBAB@gmail.com'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
