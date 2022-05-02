import 'package:flutter/material.dart';

Future<void> circulerDialog(BuildContext context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    },
  );
}

void navigatorPop({required BuildContext context}) {
  return Navigator.of(context).pop();
}
