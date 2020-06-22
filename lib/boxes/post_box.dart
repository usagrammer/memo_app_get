import 'package:hive/hive.dart';
import 'package:hive/src/box/box_impl.dart';
import 'package:memoapp2/boxes/application_box.dart';

import '../models/application_record.dart';
import '../modules/active_record_relation.dart';

class PostBox extends ApplicationRecord {
  static var _data;
  static Box _box;
  static ApplicationRecord _records;
  static Future<Box> _futureBox = Hive.openBox('posts');

  factory PostBox() {
    if (_data == null) {
      _data = new PostBox._internal();
    }

    return _data;
  }

  PostBox._internal();

  static initialize() {
    _futureBox.then((box) {
      _box = box;
      _records = new ApplicationRecord(_box.values);
    });
  }

  @override
  all() {
    _futureBox.then((box) {
      print(box);
      _records.all();
    });
  }

  @override
  find_by(key, value) {
    _futureBox.then((box) {
      _records.find_by(key, value);
    });
  }

  @override
  search(key, value) {
    _futureBox.then((box) {
      _records.search(key, value);
    });
  }
}
