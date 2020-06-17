import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'package:keyboard_actions/keyboard_actions.dart';

import 'package:memoapp2/Controllers/footer_state.dart';

class PostsNew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("<New>");
    print(context);
    print("</New>");

    String title = "";
    String content = "";
    int category_id = 0;
    List categories = ["うさぎ", "プログラミング"];
    List postOfTags = ["タグ一覧", "ほげ"];

    FocusNode _ContentSubmit = FocusNode();

    KeyboardActionsConfig _buildConfig(BuildContext context) {
      return KeyboardActionsConfig(
        keyboardActionsPlatform: KeyboardActionsPlatform.ALL,
        keyboardBarColor: Colors.grey[200],
        nextFocus: true,
        actions: [
          KeyboardAction(focusNode: _ContentSubmit, toolbarButtons: [
            (node) {
              return GestureDetector(
                onTap: () => {print("dawad"), node.unfocus()},
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.close),
                ),
              );
            }
          ]),
        ],
      );
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.file_download,
                color: Colors.white,
              ),
            )
          ],
          title: Text('新規投稿')),
      body: KeyboardActions(
        config: _buildConfig(context),
        child: Column(
          children: <Widget>[
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  hintText: 'タイトル',
                ),
                enabled: true,
                // 入力数
                maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines: 1,
                //パスワード
                onChanged: (text) {
                  title = text;
                  print("title_changed:${title}");
                }),
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<int>(
                    value: category_id,
                    onChanged: (int) {
                      category_id = int;
                      print("changed_category_id:${category_id}");
                    },
                    items: categories.map((category) {
                      print("build_Cateogyr");
                      print(category);
                      return DropdownMenuItem<int>(
                        value: categories.indexOf(category),
                        child: Text(category),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'カテゴリを追加',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.add_circle),
                          onPressed: () {
                            debugPrint('222');
                          }),
                    ),
                    enabled: true,
                    // 入力数
                    maxLength: 10,
                    maxLengthEnforced: false,
                    style: TextStyle(color: Colors.red),
                    obscureText: false,
                    maxLines: 1,
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: DropdownButton<int>(
                    value: category_id,
                    onChanged: (int) {
                      category_id = int;
                      print("changed_category_id:${category_id}");
                    },
                    items: postOfTags.map((tag) {
                      print("build_postOftags");
                      print(tag);
                      return DropdownMenuItem<int>(
                        value: postOfTags.indexOf(tag),
                        child: Text(tag),
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.all(10),
                      hintText: 'タグを追加',
                      suffixIcon: IconButton(
                          icon: Icon(Icons.add_circle),
                          onPressed: () {
                            debugPrint('222');
                          }),
                    ),
                    enabled: true,
                    // 入力数
                    maxLength: 10,
                    maxLengthEnforced: false,
                    style: TextStyle(color: Colors.red),
                    obscureText: false,
                    maxLines: 1,
                    onSubmitted: (text) {
                      print("saved: ${text}");
                    },
                  ),
                ),
              ],
            ),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.all(10),
                  hintText: '本文',
                ),
                enabled: true,
                focusNode: _ContentSubmit,
                // 入力数
                maxLength: 10,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.red),
                obscureText: false,
                maxLines: 10,
                //パスワード
                onChanged: (text) {
                  content = text;
                  print("content_changed:${content}");
                }),
          ],
        ),
      ),
    );
  }
}
