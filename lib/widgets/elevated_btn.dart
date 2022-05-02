import 'package:flutter/material.dart';

class ElevatedBtn extends StatelessWidget {
  const ElevatedBtn({
    Key? key,
    required this.press,
    required this.name,
  }) : super(key: key);

  final VoidCallback press;
  final String name;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: press,
      child: Text(name),
    );
  }
}
