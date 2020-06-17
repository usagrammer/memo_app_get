// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'posts_index_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
PostsIndexState _$PostsIndexStateFromJson(Map<String, dynamic> json) {
  return _PostsIndexState.fromJson(json);
}

class _$PostsIndexStateTearOff {
  const _$PostsIndexStateTearOff();

  _PostsIndexState call({String searchWord = ''}) {
    return _PostsIndexState(
      searchWord: searchWord,
    );
  }
}

// ignore: unused_element
const $PostsIndexState = _$PostsIndexStateTearOff();

mixin _$PostsIndexState {
  String get searchWord;

  Map<String, dynamic> toJson();
  $PostsIndexStateCopyWith<PostsIndexState> get copyWith;
}

abstract class $PostsIndexStateCopyWith<$Res> {
  factory $PostsIndexStateCopyWith(
          PostsIndexState value, $Res Function(PostsIndexState) then) =
      _$PostsIndexStateCopyWithImpl<$Res>;
  $Res call({String searchWord});
}

class _$PostsIndexStateCopyWithImpl<$Res>
    implements $PostsIndexStateCopyWith<$Res> {
  _$PostsIndexStateCopyWithImpl(this._value, this._then);

  final PostsIndexState _value;
  // ignore: unused_field
  final $Res Function(PostsIndexState) _then;

  @override
  $Res call({
    Object searchWord = freezed,
  }) {
    return _then(_value.copyWith(
      searchWord:
          searchWord == freezed ? _value.searchWord : searchWord as String,
    ));
  }
}

abstract class _$PostsIndexStateCopyWith<$Res>
    implements $PostsIndexStateCopyWith<$Res> {
  factory _$PostsIndexStateCopyWith(
          _PostsIndexState value, $Res Function(_PostsIndexState) then) =
      __$PostsIndexStateCopyWithImpl<$Res>;
  @override
  $Res call({String searchWord});
}

class __$PostsIndexStateCopyWithImpl<$Res>
    extends _$PostsIndexStateCopyWithImpl<$Res>
    implements _$PostsIndexStateCopyWith<$Res> {
  __$PostsIndexStateCopyWithImpl(
      _PostsIndexState _value, $Res Function(_PostsIndexState) _then)
      : super(_value, (v) => _then(v as _PostsIndexState));

  @override
  _PostsIndexState get _value => super._value as _PostsIndexState;

  @override
  $Res call({
    Object searchWord = freezed,
  }) {
    return _then(_PostsIndexState(
      searchWord:
          searchWord == freezed ? _value.searchWord : searchWord as String,
    ));
  }
}

@JsonSerializable()
class _$_PostsIndexState
    with DiagnosticableTreeMixin
    implements _PostsIndexState {
  const _$_PostsIndexState({this.searchWord = ''}) : assert(searchWord != null);

  factory _$_PostsIndexState.fromJson(Map<String, dynamic> json) =>
      _$_$_PostsIndexStateFromJson(json);

  @JsonKey(defaultValue: '')
  @override
  final String searchWord;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PostsIndexState(searchWord: $searchWord)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PostsIndexState'))
      ..add(DiagnosticsProperty('searchWord', searchWord));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PostsIndexState &&
            (identical(other.searchWord, searchWord) ||
                const DeepCollectionEquality()
                    .equals(other.searchWord, searchWord)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(searchWord);

  @override
  _$PostsIndexStateCopyWith<_PostsIndexState> get copyWith =>
      __$PostsIndexStateCopyWithImpl<_PostsIndexState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostsIndexStateToJson(this);
  }
}

abstract class _PostsIndexState implements PostsIndexState {
  const factory _PostsIndexState({String searchWord}) = _$_PostsIndexState;

  factory _PostsIndexState.fromJson(Map<String, dynamic> json) =
      _$_PostsIndexState.fromJson;

  @override
  String get searchWord;
  @override
  _$PostsIndexStateCopyWith<_PostsIndexState> get copyWith;
}
