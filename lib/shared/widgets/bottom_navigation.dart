import 'dart:developer';

import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  final List<Widget> screens;
  final int selectedIndex;

  const BottomNavigation({
    super.key,
    required this.screens,
    required this.selectedIndex,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  List<Widget>? _screens;
  int? _selectedIndex;

  @override
  void initState() {
    super.initState();
    _screens = widget.screens;
    _selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.screens != _screens) {
      _screens = widget.screens;
    }
    if (widget.selectedIndex != _selectedIndex) {
      _selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConvexAppBar.builder(
      count: _screens?.length ?? 0,
      initialActiveIndex: _selectedIndex,
      height: 60,
      curveSize: 110,
      backgroundColor: Colors.blue,
      top: -30,
      itemBuilder: _ConvexAppBarBuilder(),
    );
  }
}

class _ConvexAppBarBuilder extends DelegateBuilder {
  @override
  Widget build(BuildContext context, int index, bool active) {
    log('build: $index, $active');
    return Text('TAB $index');
  }
}
