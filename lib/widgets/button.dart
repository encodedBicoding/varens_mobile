
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final Widget child;
  final Color bgColor;
  final Function() onPressed;
  Button({required this.bgColor, required this.child, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Material(
      shadowColor: Colors.transparent,
      color: Colors.transparent,
      child: InkWell(
        onTap: this.onPressed,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 13,
          ),
          decoration: BoxDecoration(
            color: this.bgColor,
            borderRadius: BorderRadius.circular(9)
          ),
          child: this.child,
        ),
      ),
    );
  }
}