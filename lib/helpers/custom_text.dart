import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class CustomTextCasing {
  static String toSentenceCase({required String text}) {
    if (text.isNotEmpty) {
      var firstLetter = text[0].toUpperCase();
      var otherLetters = text.substring(1, text.length).toLowerCase();
      return '$firstLetter$otherLetters';
    } else {
      return '';
    }
  }
}

class CustomText extends StatelessWidget {
  final String title;
  final bool isCenter;
  final bool isBold;
  final bool isPrimary;
  final double textSize;
  final Color textColor;
  final FontWeight fontWeight;
  final bool hasFontWeight;
  final TextOverflow textOverflow;
  final double lineHeight;

  const CustomText(
      {Key? key,
        required this.title,
        this.isCenter = false,
        this.textSize = 15,
        this.isBold = false,
        this.isPrimary = false,
        required this.textColor,
        this.fontWeight = FontWeight.normal,
        this.textOverflow = TextOverflow.clip,
        this.lineHeight = 1.1,
        this.hasFontWeight = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildTitleText();
  }

  Widget _buildTitleText() {
    FontWeight _fontWeight;
    TextStyle _textStyle;
    Color _txtColor;

    _fontWeight = hasFontWeight
        ? fontWeight
        : isBold
        ? FontWeight.w700
        : FontWeight.normal;
    _textStyle = TextStyle();
    _txtColor = textColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: AutoSizeText(title,
        textAlign: isCenter ? TextAlign.center : TextAlign.left,
        style: _textStyle.copyWith(
            fontSize: textSize, fontWeight: _fontWeight, color: _txtColor, height: this.lineHeight),
        wrapWords: true,
        softWrap: true,
        overflow: this.textOverflow,
      ),
    );
  }
}