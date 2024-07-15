import 'package:flutter/material.dart';
class ImageDimensions extends ChangeNotifier {
  double width = 150.0;
  double height = 200.0;

  void updateDimensions(double newWidth, double newHeight) {
    width = newWidth;
    height = newHeight;
    notifyListeners();
  }
}
