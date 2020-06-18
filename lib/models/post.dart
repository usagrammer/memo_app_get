import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  String content;
  @HiveField(1)
  String image;
  @HiveField(2)
  int category_id;
  @HiveField(3)
  int id;

  Post(this.content, this.image, this.category_id, this.id);
}

/// Boxを内包するクラス
/// Singletonやboxを開くのを非同期で待つのに使う
/// Boxのファイル名を間違えないようにするためにもこれを起点にアクセスすることとする
/// また、DIに対応するときにもきっと役に立つ
class PostBox {
  Future<Box> box = Hive.openBox<Post>('posts');

  /// deleteFromDiskをした後はdatabaseが閉じてしまうため、もう一度開くための関数
  Future<void> open() async {
    Box b = await box;
    if (!b.isOpen) {
      box = Hive.openBox<Post>('posts');
    }
  }
}
