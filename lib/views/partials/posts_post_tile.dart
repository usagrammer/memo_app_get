import 'package:flutter/material.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

class MemoTile extends StatelessWidget {
  String title;
  String category_name;
  List tags;
  Icon icon;

  MemoTile(this.title, this.category_name, this.tags, this.icon);

  @override
  Widget build(BuildContext context) {
    String category_name_tags = "category:" + category_name + "\n tags:";
    tags.forEach((tag) {
      category_name_tags += " ";
      category_name_tags += tag;
    });

    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: Container(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            child: icon,
            backgroundColor: Colors.pink,
          ),
          title: Text(title),
          subtitle: Text(category_name_tags),
//          isThreeLine: true,
          onTap: () => {},
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          color: Colors.black45,
          iconWidget: Text(
            "非表示",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () => {}, // _showSnackBar('More'),
        ),
        IconSlideAction(
          color: Colors.red,
          iconWidget: Text(
            "削除",
            style: TextStyle(color: Colors.white),
          ),
          onTap: () => {}, // _showSnackBar('Delete'),
        ),
      ],
    );
  }
}
