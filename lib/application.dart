import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'group/group_screen.dart';
import 'history/history_screen.dart';
import 'item/item_screen.dart';
import 'shared/states.dart';
import 'shared/widgets.dart';
import 'themedata.dart';

class Application extends ConsumerStatefulWidget {
  const Application({super.key});

  @override
  ConsumerState<Application> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
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
          children: _screens,
          onPageChanged: (index) {
            ref.read(bottomNavigationProvider.notifier).setIndex(index);
          },
        ),
        bottomNavigationBar: BottomNavigation(screenCount: _screens.length),
      ),
    );
  }
}
