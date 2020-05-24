import 'package:flutter/material.dart';
import 'package:flutter2/Widget/UserTransaction.dart';
import 'transaction.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter 2 ', home: MyHomePage());
  }
}
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 2'),
      ),
      body: SingleChildScrollView(
          child: UserTransaction())
    );
  }

}
