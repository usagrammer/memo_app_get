import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'posts_index_state.freezed.dart';
part 'posts_index_state.g.dart';

@freezed
abstract class PostsIndexState with _$PostsIndexState {
  const factory PostsIndexState({
    @Default("") String searchWord,
  }) = _PostsIndexState;
  factory PostsIndexState.fromJson(Map<String, dynamic> json) =>
      _$PostsIndexStateFromJson(json);
}

class PostsIndexStateNotifier extends StateNotifier<PostsIndexState> {
  PostsIndexStateNotifier() : super(const PostsIndexState()) {}
  changeWord(String word) => state = state.copyWith(searchWord: word);
}
