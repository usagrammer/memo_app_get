import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FootersController extends GetController {
  int currentIndex = 0;
  int changedIndex(selectedIndex) {
    currentIndex = selectedIndex;
    print("get!!");
    print("state: ${selectedIndex}");
    // use update method to update all count variables
    update();
  }
}
