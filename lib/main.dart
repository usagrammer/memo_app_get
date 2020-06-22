import 'package:flutter/material.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'modules/active_record_relation.dart';

import 'package:faker/faker.dart';
import 'dart:math' as math;

import 'package:memoapp2/controllers/footers_controller.dart';
import 'package:memoapp2/controllers/posts_controller.dart';
import 'package:get/get.dart';
import 'boxes/post_box.dart';

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

  final PostsController post = Get.put(PostsController());
  runApp(Init());
}

class Init extends StatelessWidget {
  final FootersController footer = Get.put(FootersController());
  final PostsController post = Get.find();

  @override
  Widget build(BuildContext context) {
    print("<Init>");
//    Hive.close();
//    Hive.deleteFromDisk();
//    var box;
    var postBox = new PostBox();
    (() async {
      await postBox.initialize();
      var box = postBox.box;

      var faker = new Faker();
      var rand = new math.Random();
//      Post new_post = Post(
//          faker.sport.name(), faker.internet.email(), rand.nextInt(100), 1 + 0);
//      box.put(new_post.id, new_post);
//      postBox.all();

      Post result = postBox.find_by(key: "id", value: 9);
      print("result:$result");
      var results = postBox.search(key: "id", value: 9);
      print("results:$results");
    })();

    return GetMaterialApp(routes: <String, WidgetBuilder>{
      '/home': (BuildContext context) => new Base(),
      '/posts/new': (BuildContext context) => new PostsNew()
    }, home: Base());
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
