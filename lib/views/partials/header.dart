import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Icon(AntDesign.stepforward),
      actions: [Icon(AntDesign.stepforward)],
      title: Text('ホーム'),
    );
  }
}
