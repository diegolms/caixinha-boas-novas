import 'package:flutter/material.dart';
import 'package:caixinha_boas_novas/screens/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Caixinha boas novas',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}