import 'package:flutter/material.dart';

void onLoading(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 0,
        backgroundColor: Colors.transparent,
        child: Center(child: new CircularProgressIndicator()),
      );
    },
  );
}

killLoader(BuildContext context) {
  new Future.delayed(new Duration(seconds: 0), () {
    Navigator.pop(context); //pop dialog
  });
}
