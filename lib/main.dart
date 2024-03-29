import 'package:cor_waterstation/providers/measurements.dart';
import 'package:cor_waterstation/providers/persons.dart';
import 'package:cor_waterstation/screens/identification.dart';
import 'package:cor_waterstation/screens/investment_account.dart';
import 'package:cor_waterstation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Persons(),
        ),
        ChangeNotifierProvider(
          create: (_) => Measurements(),
        )
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.light().copyWith(
            // copywith는 themedata.light를 다 따르지만 TextTheme만 다른것을 의미
            textTheme: TextTheme(
              body1: TextStyle(color: Colors.black54),
            ),
          ),
          home: WelcomeScreen(),
          ),
    );
  }
}
