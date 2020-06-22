// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  int typeId = 1;

  @override
  Post read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      fields[4] as String,
      fields[5] as String,
      (fields[6] as List)?.cast<HiveObject>(),
      (fields[7] as List)?.cast<HiveObject>(),
      (fields[8] as List)?.cast<HiveObject>(),
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(5)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.content)
      ..writeByte(6)
      ..write(obj.images)
      ..writeByte(7)
      ..write(obj.categories)
      ..writeByte(8)
      ..write(obj.tags);
  }
}
