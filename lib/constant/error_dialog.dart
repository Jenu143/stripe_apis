import 'package:flutter/material.dart';

Future<void> errorDialog(
    {required BuildContext context, required String error}) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return Center(
        child: AlertDialog(
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
          title: Text(error),
        ),
      );
    },
  );
}
