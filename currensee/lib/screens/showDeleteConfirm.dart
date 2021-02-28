import 'package:currensee/widgets/watchlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

showAlertDialog(BuildContext context, String prodName) {

  // set up the buttons
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {
      Navigator.pop(context);
    },
  );
  Widget continueButton = FlatButton(
    child: Text("Yes, Delete"),
    onPressed:  () {
      var aWL = Provider.of<WatchDict>(context, listen: false);
      aWL.remove(prodName);
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Confirm Delete"),
    content: Text("Would you like to remove $prodName from watchlist?"),
    actions: [
      cancelButton,
      continueButton,
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