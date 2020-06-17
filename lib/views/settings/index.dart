import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'package:memoapp2/Controllers/footer_state.dart';

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
