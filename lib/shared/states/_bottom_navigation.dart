import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '_bottom_navigation.freezed.dart';
part '_bottom_navigation.g.dart';

@freezed
class BottomNavigationState with _$BottomNavigationState {
  const factory BottomNavigationState({
    /// 선택된 인덱스
    required int selectedIndex,

    /// 페이지 컨트롤러
    required PageController pageController,
  }) = _BottomNavigationState;
}

@riverpod
class BottomNavigation extends _$BottomNavigation {
  @override
  BottomNavigationState build() {
    return BottomNavigationState(
      selectedIndex: 1,
      pageController: PageController(),
    );
  }

  /// 하단 네비게이션 바의 인덱스를 설정합니다.
  void setIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  /// 하단 네비게이션 바의 인덱스 화면으로 이동합니다.
  void gotoIndex(int index) {
    setIndex(index);
    state.pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
