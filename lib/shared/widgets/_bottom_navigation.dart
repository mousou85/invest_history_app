import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../states.dart';

/// 하단 네비게이션 위젯
class BottomNavigation extends ConsumerStatefulWidget {
  /// 스크린 갯수
  final int screenCount;

  const BottomNavigation({
    super.key,
    required this.screenCount,
  });

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  /// 아이콘 목록
  final List<Icon> _icons = [
    const Icon(Symbols.account_balance),
    const Icon(Symbols.list),
    const Icon(Symbols.paid),
  ];

  /// 라벨 목록
  final List<String> _labels = [
    'Groups',
    'History',
    'Items',
  ];

  @override
  void initState() {
    super.initState();
  }

  /// on tap 이벤트
  ///
  /// - [index] : 선택된 인덱스
  void _onTap(int index) {
    ref.read(bottomNavigationProvider.notifier).gotoIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(bottomNavigationProvider);

    return ConvexAppBar.builder(
      count: widget.screenCount,
      initialActiveIndex: provider.selectedIndex,
      height: 60,
      curveSize: 110,
      backgroundColor: Colors.blue,
      top: -30,
      itemBuilder: _ConvexAppBarBuilder(
        icons: _icons,
        labels: _labels,
        activeCircleColor: Colors.white,
        activeIconColor: Colors.blue,
        activeLabelColor: Colors.blue,
        iconColor: Colors.white,
        labelColor: Colors.white,
      ),
      onTap: _onTap,
    );
  }
}

/// convex app bar 커스텀 아이템 빌더
class _ConvexAppBarBuilder extends DelegateBuilder {
  final List<Icon> icons;
  final List<String> labels;
  final Color activeCircleColor;
  final Color activeIconColor;
  final Color activeLabelColor;
  final Color iconColor;
  final Color labelColor;

  _ConvexAppBarBuilder({
    required this.icons,
    required this.labels,
    this.activeCircleColor = Colors.white,
    this.activeIconColor = Colors.blue,
    this.activeLabelColor = Colors.blue,
    this.iconColor = Colors.white,
    this.labelColor = Colors.white,
  });

  /// 선택된 항목 생성
  Widget _buildActiveItem(int index) {
    final iconData = icons[index].icon;
    final labelText = labels[index];

    final icon = Icon(
      iconData,
      color: activeIconColor,
      size: 35,
      weight: 700,
    );
    final label = Text(
      labelText,
      style: TextStyle(color: activeLabelColor, fontSize: 9),
    );

    return _TransitionItem(
      index: index,
      child: Container(
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: activeCircleColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            label,
          ],
        ),
      ),
    );
  }

  /// 항목 생성
  Widget _buildItem(int index) {
    final iconData = icons[index].icon;
    final labelText = labels[index];

    final icon = Icon(
      iconData,
      color: iconColor,
      size: 25,
      weight: 700,
    );
    final label = Text(
      labelText,
      style: TextStyle(color: labelColor, fontSize: 13),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        icon,
        label,
      ],
    );
  }

  @override
  Widget build(BuildContext context, int index, bool active) {
    return active ? _buildActiveItem(index) : _buildItem(index);
  }
}

/// 선택된 항목 애니메이션
class _TransitionItem extends StatefulWidget {
  final int index;
  final Widget child;

  const _TransitionItem({
    required this.index,
    required this.child,
  });

  @override
  State<_TransitionItem> createState() => _TransitionItemState();
}

class _TransitionItemState extends State<_TransitionItem>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _setAnimation();
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.runtimeType != widget.runtimeType) {
      animationController?.dispose();
      _setAnimation();
    } else {
      if (widget.index == oldWidget.index) {
        return;
      }

      animationController?.reset();
      animationController?.forward();
    }
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  void _setAnimation() {
    final controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addListener(() => setState(() {}));
    controller.forward();
    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    animationController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: animation, child: widget.child);
  }
}
