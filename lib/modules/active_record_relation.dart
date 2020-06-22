import 'package:hive/hive.dart';

class ActiveRecordRelation {
  final List objects;

  ActiveRecordRelation([this.objects]);

  static Convert(data) {
    return new ActiveRecordRelation(data);
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

  find_by({key, value}) {
    print("【find_by】 key:$key, value:$value");
    print(objects);
    var result = objects.firstWhere((object) {
      print(object.toMap());
      return object.toMap()[key].toString() == value.toString();
    });
    print("【finxxxxxxd_by_result】 $result");
    return result;
  }

  search({key, value}) {
    print("【search】 key: $key, value: $value");
    var results = objects.where((object) {
      return object.toMap()[key].toString().contains(value.toString());
    });
    for (var record in results) {
//      print(record.toMap());
    }
    print("【search_result】 $results");
    return results;
  }
}
