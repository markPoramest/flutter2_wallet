import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function addTransaction;
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  NewTransaction(this.addTransaction);


  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController),
          TextField(
            decoration: InputDecoration(labelText: 'Amount'),
            controller: amountController,
            keyboardType: TextInputType.number,
          ),
          FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.red)),
              color: Colors.white,
              textColor: Colors.red,
              padding: EdgeInsets.all(10.0),
              child: Text('Submit'.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16.0,
                  )),
              onPressed: () {
                titleController.text;
                if (titleController.text.length == 0 ||
                    amountController.text.length == 0)
                  showAlertDialog(
                      context, "Error", "Please input title & amount");
                else {
                  var amount2 = double.parse(amountController.text);
                  addTransaction(titleController.text, amount2);
                }
              })
        ]);
  }

  showAlertDialog(BuildContext context, String title, String text) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}