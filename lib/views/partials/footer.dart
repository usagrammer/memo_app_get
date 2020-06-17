import 'package:flutter/material.dart';
import 'package:memoapp2/controllers/footers_controller.dart';
import 'package:provider/provider.dart';

import 'package:memoapp2/Controllers/footer_state.dart';

import 'package:get/get.dart';

class Footer extends StatelessWidget {
  final footer;
  const Footer(this.footer);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: footer.currentIndex,
        onTap: (index) => footer.changedIndex(index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("index")),
          BottomNavigationBarItem(
              icon: Icon(Icons.note_add), title: Text("new")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("setting")),
        ]);
  }
}
