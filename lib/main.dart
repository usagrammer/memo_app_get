import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:provider/provider.dart';

import 'package:memoapp2/Controllers/footer_state.dart';
import 'package:memoapp2/Controllers/posts_index_state.dart';

import 'package:memoapp2/controllers/footers_controller.dart';
import 'package:get/get.dart';

import 'views/partials/header.dart';
import 'views/partials/footer.dart';

import 'views/posts/index.dart';
import 'views/posts/new.dart';

import 'views/settings/index.dart';

void main() => runApp(Init());

class Init extends StatelessWidget {
  final FootersController footer = Get.put(FootersController());

  @override
  Widget build(BuildContext context) {
    print("<Init>");
    print(context);
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
      builder: (_) => Scaffold(
        appBar: Header(),
        body: IndexedStack(
          index: _.currentIndex,
          children: routes,
        ),
        bottomNavigationBar: Footer(),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context).pushNamed("/posts/new"),
          label: Text("new${_.currentIndex}"),
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
