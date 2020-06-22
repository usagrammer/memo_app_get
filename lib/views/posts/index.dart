import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:memoapp2/controllers/posts_controller.dart';

import '../partials/posts_post_tile.dart';

class Index extends StatelessWidget {
  final PostsController controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    print("<Index>");
    print(context);
    controller.initialize();
    print("</Index>");

    return GetBuilder<PostsController>(
      init: PostsController(),
      builder: (post) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 100,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Flexible(
                  child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        contentPadding: EdgeInsets.all(10),
                        hintText: '検索',
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
                        post.searchPost(text);
                        print(post.hittedPosts);
                      }),
                ),
                IconButton(
//                onPressed: _handlePressed,
                  color: Colors.blue,
                  icon: Icon(Icons.star),
                )
              ],
            ),
          ),
          Flexible(
            child: buildPosts(post.hittedPosts),
          )
        ],
      ),
    );
  }
}

class buildPosts extends StatelessWidget {
  final List posts;

  const buildPosts(this.posts);

  Widget build(BuildContext context) {
    print("build:ListView");
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, int index) {
        return MemoTile(
            posts[index], "bar", ["hoge", "fuga"], Icon(Icons.menu));
      },
      padding: const EdgeInsets.all(8),
    );
  }
}
