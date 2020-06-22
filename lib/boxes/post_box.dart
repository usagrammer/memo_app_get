import 'package:hive/hive.dart';
import 'package:hive/src/box/box_impl.dart';
import 'package:memoapp2/boxes/application_box.dart';

import '../models/application_record.dart';
import '../modules/active_record_relation.dart';

class PostBox extends ActiveRecordRelation {
  static var _data;
  Box box;
  static ActiveRecordRelation _records;
  Future<Box> futureBox = Hive.openBox('posts');

  factory PostBox() {
    if (_data == null) {
      _data = new PostBox._internal();
    }

    return _data;
  }

  PostBox._internal();

  initialize() async {
    box = await futureBox;
    print("initialize!!!");
    print(box);
    _records = new ActiveRecordRelation(box.values.toList());
  }

  @override
  all() async {
    return _records.all();
  }

  @override
  find_by({key, value}) {
    return _records.find_by(key: key, value: value);
  }

  @override
  search({key, value}) {
    return _records.search(key: key, value: value);
  }

  @override
  pluck({key}) {
    return _records.pluck(key: key);
  }
}
