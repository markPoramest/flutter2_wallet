import 'package:flutter/material.dart';
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
  final List<Transaction> transaction = [
    Transaction(
        id: 'T001',
        title: 'Pay for breakfast',
        amount: 100,
        date: DateTime.now(),
        reason: 'I\'m hungry'),
    Transaction(
        id: 'T002',
        title: 'Pay for new notebook',
        amount: 15000,
        date: DateTime.now(),
        reason: 'For working'),
    Transaction(
        id: 'T003',
        title: 'Pay for tax',
        amount: 5000,
        date: DateTime.now(),
        reason: 'Pay Text')

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter 2'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: transaction.map((tx) {
            //loop in List
            return Card(
                child:
                    Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
              ListTile(
                  leading: Icon(Icons.account_balance_wallet,
                      color: Colors.redAccent),
                  title: Text(tx.title),
                  subtitle: Text(tx.amount.toString() +
                      '''
                ''' +
                      new DateFormat.yMMMd().format(tx.date) +
                      '''
                   \n''' +
                      tx.reason))
            ]));
          }).toList()),
    );
  }
}
