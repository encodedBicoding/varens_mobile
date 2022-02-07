
import 'package:flutter/cupertino.dart';

class IconHolder extends StatelessWidget{
  final Color bgColor;
  final Widget icon;

  IconHolder({required this.bgColor, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: icon,
    );
  }
}