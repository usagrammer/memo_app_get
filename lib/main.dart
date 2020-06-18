import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:memoapp2/Controllers/footer_state.dart';
import 'package:memoapp2/Controllers/posts_index_state.dart';

import 'package:memoapp2/controllers/footers_controller.dart';
import 'package:memoapp2/controllers/posts_controller.dart';
import 'package:get/get.dart';

import 'views/partials/header.dart';
import 'views/partials/footer.dart';

import 'models/post.dart';

import 'views/posts/index.dart';
import 'views/posts/new.dart';

import 'views/settings/index.dart';

void main() async {
  // Hiveの初期化
  await Hive.initFlutter();
  // TODO カスタムアダプターの追加
  Hive.registerAdapter(PostAdapter());
//  var posts = await Hive.openBox('posts');
//
//  var add_post = Post("hoge", "fugaa", 1);
//  posts.add(add_post);
//  print("posts.length: ${posts.length}");

  final PostsController post = Get.put(PostsController());
  await print("postBox.length: ${post.postBox.box}");
//  Post add_post = Post("hoge", "fugaa", 1);
  post.postBox.box.then((box) {
    print("then");
//    Hive.close();
//    Hive.deleteFromDisk();
    print(box.values);
    print("before_box.length: ${box.length}");
    Post new_post = Post("hoge", "fugaa", 1, 1 + box.length);
    box.put(new_post.id, new_post);
    print("after_box.length: ${box.length}");
    print("box.all:${box.values}");
    print("box.get(${new_post.id}):${box.get(new_post.id)}");
    runApp(Init());
  });
}

class Init extends StatelessWidget {
  final FootersController footer = Get.put(FootersController());
  final PostsController post = Get.find();

  @override
  Widget build(BuildContext context) {
    print("<Init>");
    print(context);
    post.postBox.box.then((box) {
      print("box.length_in_INIT: ${box.length}");
      post.initializeData(box);
    });
    return GetMaterialApp(
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new Base(),
          '/posts/new': (BuildContext context) => new PostsNew()
        },
        home: MultiProvider(
          providers: [
            StateNotifierProvider<FooterStateNotifier, FooterState>(
                create: (_) => FooterStateNotifier()),
            StateNotifierProvider<PostsIndexStateNotifier, PostsIndexState>(
                create: (_) => PostsIndexStateNotifier()),
          ],
          child: Base(),
        ));
  }
}

class Base extends StatelessWidget {
  var routes = [
    Index(),
    PostsNew(),
    SettingsIndex(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FootersController>(
      init: FootersController(),
      builder: (footer) => Scaffold(
        appBar: Header(),
        body: IndexedStack(
          index: footer.currentIndex,
          children: routes,
        ),
        bottomNavigationBar: Footer(footer),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pushNamed("/posts/new"),
          label: Text("new${footer.currentIndex}"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
