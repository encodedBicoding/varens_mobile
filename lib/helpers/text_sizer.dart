
import "package:flutter/material.dart";

String isPortrait(context) {
  if(MediaQuery.of(context).size.height > MediaQuery.of(context).size.width) {
    double difference = MediaQuery.of(context).size.height / MediaQuery.of(context).size.width;
    if(difference < 1.4) {
      return 'tablet';
    } else {
      return 'phone';
    }
  } else {
    return 'monitor';
  }
}

mainSizer({required BuildContext context, double? size}) {
  switch(isPortrait(context)) {
    case 'phone':
      return MediaQuery.of(context).size.width / (size ?? 22);
    case 'tablet':
      return MediaQuery.of(context).size.width / (size != null ? size*1.8 : 22);
    default:
      return MediaQuery.of(context).size.height / (size ?? 22);
  }
}