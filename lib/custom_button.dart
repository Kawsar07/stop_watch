import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Color color;
  var onPress;
  final String label;

  CustomButton(
      {Key? key,
      required this.color,
      required this.label,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        label,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
