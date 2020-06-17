import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:state_notifier/state_notifier.dart';

part 'footer_state.freezed.dart';
part 'footer_state.g.dart';

@freezed
abstract class FooterState with _$FooterState {
  const factory FooterState({
    @Default(1) int selectedIndex,
  }) = _FooterState;
  factory FooterState.fromJson(Map<String, dynamic> json) => _$FooterStateFromJson(json);
}

class FooterStateNotifier extends StateNotifier<FooterState> {
  FooterStateNotifier() : super(const FooterState()) {}
  changeIndex(int index) => state = state.copyWith(selectedIndex: index);
}