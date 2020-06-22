import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/post.dart';

class PostsController extends GetController {
  final hittedPosts = List<String>().obs;
//  final postBox = PostBox();
  List posts = ["hoge", "fuga", "bar"];

  Box post_box;

  void initializeData(box) {
    print("initialize!!!");
    print(box);
    post_box = box;
  }

  searchPost(String searchWord) {
    List result = posts.where((post) => post.contains(searchWord)).toList();
    hittedPosts.assignAll(result.whereType());
    update();
  }
}
