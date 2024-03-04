import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

import '../states.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  final int screenCount;

  const BottomNavigation({
    super.key,
    required this.screenCount,
  });

  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  final List<Icon> _icons = [
    const Icon(Symbols.account_balance),
    const Icon(Symbols.list),
    const Icon(Symbols.paid),
  ];

  final List<String> _labels = [
    'Groups',
    'History',
    'Items',
  ];

  @override
  void initState() {
    super.initState();
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
      ),
      onTap: (index) {
        ref.read(bottomNavigationProvider.notifier).gotoIndex(index);
      },
    );
  }
}

class _ConvexAppBarBuilder extends DelegateBuilder {
  final List<Icon> icons;
  final List<String> labels;

  _ConvexAppBarBuilder({
    required this.icons,
    required this.labels,
  });

  Widget _buildActiveItem(int index) {
    final icon = Icon(
      icons[index].icon,
      color: Colors.blue,
      size: 30,
      weight: 700,
    );
    final label = Text(
      labels[index],
      style: const TextStyle(color: Colors.blue, fontSize: 10),
    );

    return Container(
      margin: const EdgeInsets.all(5),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          label,
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    final icon = Icon(
      icons[index].icon,
      color: Colors.white,
      size: 25,
      weight: 700,
    );
    final label = Text(
      labels[index],
      style: const TextStyle(color: Colors.white, fontSize: 13),
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
