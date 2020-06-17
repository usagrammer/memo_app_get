import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostsController extends GetController {
  String searchWord = "";

  final hittedPosts = List<String>().obs;

  List posts = ["hoge", "bar", "fuga"];

  changeWord(String newWord) {
    searchWord = newWord;
    print("get!!");
    print("state: ${searchWord}");
    // use update method to update all count variables
    update();
  }

  searchPost(String searchWord) {
    print("search!!!");
    print("from:${posts}, by:${searchWord}");
    List result = posts.where((post) => post.contains(searchWord)).toList();
    print("result:${result}");
    print("before:${hittedPosts}");
    hittedPosts.assignAll(result.whereType());
    print("after:${hittedPosts}");
    update();
  }
}
