import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group/group_screen.dart';
import 'invest_history/history_screen.dart';
import 'invest_item/item_screen.dart';
import 'shared/states.dart';
import 'shared/widgets.dart';
import 'themedata.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  /// 화면 목록
  final _screens = [
    GroupScreen(),
    HistoryScreen(),
    ItemScreen(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// 페이지 변경 이벤트
  void _onPageChanged(int index) {
    ref.read(bottomNavigationProvider.notifier).setIndex(index);
  }

  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(bottomNavigationProvider);

    return MaterialApp(
      theme: materialThemeData,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('test'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: PageView(
          controller: provider.pageController,
          onPageChanged: _onPageChanged,
          physics: const NeverScrollableScrollPhysics(),
          children: _screens,
        ),
        bottomNavigationBar: BottomNavigation(screenCount: _screens.length),
      ),
    );
  }
}
