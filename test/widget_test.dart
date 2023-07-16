import 'package:flutter/cupertino.dart';

extension NumberParsing on String {
  int parseInt() {
    return int.parse(this);
  }

  double parseDouble() {
    return double.parse(this);
  }
}

void main() {
  var x = "10.00";
  int i = 2;

  // int total = x.parseInt() + i;

  debugPrint("Total: ${x.parseDouble()}");
}
