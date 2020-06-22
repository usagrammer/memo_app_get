import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SettingsIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("<SettingsIndex>");
    print(context);
    print("</SettingsIndex>");
    return Text("settings_index");
//    return Text(context.select<FooterState, int>((state) => state.count).toString());
  }
}
