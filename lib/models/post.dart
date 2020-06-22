import 'package:hive/hive.dart';
import 'package:memoapp2/models/application_record.dart';
import 'package:memoapp2/models/active_record.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post extends ActiveRecord {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  HiveList images;
  @HiveField(3)
  HiveList categories;
  @HiveField(4)
  HiveList tags;

//  static Future<Box> box = Hive.openBox<Post>('posts');

  Post(this.title, this.content, this.images, this.categories, this.tags);

  toMap() {
    return {
      "title": this.title,
      "content": this.content,
      "images": this.images,
      "categories": this.categories,
      "tags": this.tags
    };
  }
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
