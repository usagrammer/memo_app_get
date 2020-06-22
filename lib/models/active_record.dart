import 'package:hive/hive.dart';

class ActiveRecord {
  openBox() async {
    Future<Box> futureBox = Hive.openBox('posts');
    return futureBox;
  }

  create() async {
    print("【create!!!】");
    print("this: $this");
    Box box = await openBox();
    box.add(this);
    print("created!!");
    print("box.values.length:${box.values.length}");
    for (var record in box.values) {
      var _id = record.toMap()["id"];
      var content = record.toMap()["content"];
      print("id:$_id, content:$content");
    }
  }
}
