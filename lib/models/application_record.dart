import 'package:memoapp2/models/active_record.dart';

class ApplicationRecord extends ActiveRecord {
  final List<Map> objects;

  ApplicationRecord([this.objects]);

  static Convert(data) {
    return new ApplicationRecord(data);
  }

  all() {
    print("【all】");
    print("_objects:$objects");
    print("_objects.then:$objects");
    print("_objects.then_values:$objects.values.length}");
    print("_objectsvvvv_class:$objects.runtimeType}");
    for (var object in objects) {
//        print("${record.id}: ${record.content}");
    }
    return objects;
  }

  find_by(key, value) {
    var result = objects.firstWhere((object) {
      return object[key] == value;
    });
    return result;
  }

  search(key, value) {
    print("【search】 key: $key, value: $value");
    var results = objects.where((object) {
      return object[key].toString().contains(value.toString());
    });
    for (var record in results) {
//      print(record.toMap());
    }
    return results;
  }
}
