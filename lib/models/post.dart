import 'package:hive/hive.dart';
import 'package:memoapp2/models/application_record.dart';
import 'package:memoapp2/models/active_record.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post extends ActiveRecord {
  @HiveField(0)
  String content;

  @HiveField(1)
  String image;
  @HiveField(2)
  int category_id;
  @HiveField(3)
  int id;

//  static Future<Box> box = Hive.openBox<Post>('posts');

  Post(this.content, this.image, this.category_id, this.id);

  toMap() {
    return {
      "content": this.content,
      "image": this.image,
      "category_id": this.category_id,
      "id": this.id
    };
  }

//  static All() {
//    print("Post.All!!!");
//    box.then((records) {
//      records.values.forEach((record) {
//        print("${record.id}: ${record.content}");
//      });
//      return records.values;
//    });
//  }
//
//  static find_by({key, value}) {
//    print("【find_by】 key: $key, value: $value");
//    box.then((records) {
//      print("aaaaaaaaaaaaaaa");
//      print(records.toMap());
//      print(records.values);
//      print(records.values.first.content);
////      records.values.firstWhere((record) => record.get("$key") == value);
//    });
//  }
}

/// Boxを内包するクラス
/// Singletonやboxを開くのを非同期で待つのに使う
/// Boxのファイル名を間違えないようにするためにもこれを起点にアクセスすることとする
/// また、DIに対応するときにもきっと役に立つ
//class PostBox {
//  Future<Box> box = Hive.openBox<Post>('posts');
//
//  /// deleteFromDiskをした後はdatabaseが閉じてしまうため、もう一度開くための関数
//  Future<void> open() async {
//    Box b = await box;
//    if (!b.isOpen) {
//      box = Hive.openBox<Post>('posts');
//    }
//  }
//}
