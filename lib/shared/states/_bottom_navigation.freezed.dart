// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of '_bottom_navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BottomNavigationState {
  /// 선택된 인덱스
  int get selectedIndex => throw _privateConstructorUsedError;

  /// 페이지 컨트롤러
  PageController get pageController => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BottomNavigationStateCopyWith<BottomNavigationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BottomNavigationStateCopyWith<$Res> {
  factory $BottomNavigationStateCopyWith(BottomNavigationState value,
          $Res Function(BottomNavigationState) then) =
      _$BottomNavigationStateCopyWithImpl<$Res, BottomNavigationState>;
  @useResult
  $Res call({int selectedIndex, PageController pageController});
}

/// @nodoc
class _$BottomNavigationStateCopyWithImpl<$Res,
        $Val extends BottomNavigationState>
    implements $BottomNavigationStateCopyWith<$Res> {
  _$BottomNavigationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? pageController = null,
  }) {
    return _then(_value.copyWith(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BottomNavigationStateImplCopyWith<$Res>
    implements $BottomNavigationStateCopyWith<$Res> {
  factory _$$BottomNavigationStateImplCopyWith(
          _$BottomNavigationStateImpl value,
          $Res Function(_$BottomNavigationStateImpl) then) =
      __$$BottomNavigationStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int selectedIndex, PageController pageController});
}

/// @nodoc
class __$$BottomNavigationStateImplCopyWithImpl<$Res>
    extends _$BottomNavigationStateCopyWithImpl<$Res,
        _$BottomNavigationStateImpl>
    implements _$$BottomNavigationStateImplCopyWith<$Res> {
  __$$BottomNavigationStateImplCopyWithImpl(_$BottomNavigationStateImpl _value,
      $Res Function(_$BottomNavigationStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedIndex = null,
    Object? pageController = null,
  }) {
    return _then(_$BottomNavigationStateImpl(
      selectedIndex: null == selectedIndex
          ? _value.selectedIndex
          : selectedIndex // ignore: cast_nullable_to_non_nullable
              as int,
      pageController: null == pageController
          ? _value.pageController
          : pageController // ignore: cast_nullable_to_non_nullable
              as PageController,
    ));
  }
}

/// @nodoc

class _$BottomNavigationStateImpl implements _BottomNavigationState {
  const _$BottomNavigationStateImpl(
      {required this.selectedIndex, required this.pageController});

  /// 선택된 인덱스
  @override
  final int selectedIndex;

  /// 페이지 컨트롤러
  @override
  final PageController pageController;

  @override
  String toString() {
    return 'BottomNavigationState(selectedIndex: $selectedIndex, pageController: $pageController)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavigationStateImpl &&
            (identical(other.selectedIndex, selectedIndex) ||
                other.selectedIndex == selectedIndex) &&
            (identical(other.pageController, pageController) ||
                other.pageController == pageController));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedIndex, pageController);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavigationStateImplCopyWith<_$BottomNavigationStateImpl>
      get copyWith => __$$BottomNavigationStateImplCopyWithImpl<
          _$BottomNavigationStateImpl>(this, _$identity);
}

abstract class _BottomNavigationState implements BottomNavigationState {
  const factory _BottomNavigationState(
          {required final int selectedIndex,
          required final PageController pageController}) =
      _$BottomNavigationStateImpl;

  @override

  /// 선택된 인덱스
  int get selectedIndex;
  @override

  /// 페이지 컨트롤러
  PageController get pageController;
  @override
  @JsonKey(ignore: true)
  _$$BottomNavigationStateImplCopyWith<_$BottomNavigationStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
