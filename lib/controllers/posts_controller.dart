import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../boxes/post_box.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/post.dart';

class PostsController extends GetController {
  List hittedPosts = [];
  String searchWord = "";
  List tags = [];
  int category_id = 1;
//  final postBox = PostBox();
  List posts = [];
  Box box;

  initialize() async {
    print("posts_Controller:initialize");
    Future<Box> futureBox = Hive.openBox('posts');
    box = await futureBox;
    print("posts_Controller_box:$box");
    print("posts_Controller_box_values:${box.values.toList()}");
    posts = box.values.toList();
    print("posts_Controller_posts:$posts");
    print("posts_Controller_hittedPosts:$hittedPosts");
    searchPost(searchWord);
  }

  searchPost(String newWord) async {
    print("searchword!!!");
    print("searchWord:$newWord");
    searchWord = newWord;
    List result =
        posts.where((post) => post.content.contains(searchWord)).toList();
//    result = result.map((post) => post.content);
    hittedPosts = result;
    print("hittedPosts!!!");
    print("result:$result");
    print("hittedPosts:${hittedPosts.toList()}");
    update();
  }
}
