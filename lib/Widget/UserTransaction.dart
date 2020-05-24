import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter2/transaction.dart';
import 'NewTransaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
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

  void addTransaction(String title2, double amount2) {
    setState(() {
      transaction.add(new Transaction(id: 't4',
          title: title2,
          amount: amount2,
          date: DateTime.now(),
          reason: '0'));
    });
  }

  @override
  Widget buildCard(Transaction tx) {
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
                  new DateFormat('dd/MM/yyyy').format(tx.date) +
                  '''
                   \n''' +
                  tx.reason))
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(addTransaction), ...transaction.map((tx) {
          return buildCard(tx);
        }).toList()
      ],
    );
  }
}