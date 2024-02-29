import 'package:flutter/material.dart';

import 'group/group_screen.dart';
import 'history/history_screen.dart';
import 'item/item_screen.dart';
import 'shared/widgets.dart';

class Application extends StatefulWidget {
  const Application({super.key});

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  int _selectedIndex = 0;
  final _pageController = PageController();

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
    _pageController.dispose();
    super.dispose();
  }

  void _onBottomNavigationTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('test'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: PageView(
        controller: _pageController,
        children: _screens,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      bottomNavigationBar: BottomNavigation(
        selectedIndex: _selectedIndex,
        screens: _screens,
      ),
      // bottomNavigationBar: StyleProvider(
      //   style: AppBarStyle(),
      //   child: ConvexAppBar(
      //     style: TabStyle.reactCircle,
      //     height: 60,
      //     curveSize: 110,
      //     backgroundColor: Colors.blue,
      //     color: Colors.black,
      //     activeColor: Colors.white,
      //     items: [
      //       TabItem(icon: Icon(Symbols.account_balance), title: 'Group'),
      //       TabItem(icon: Icon(Symbols.list), title: 'History'),
      //       TabItem(icon: Icon(Symbols.paid), title: 'Item'),
      //     ],
      //     onTap: _onBottomNavigationTapped,
      //   ),
      // ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _selectedIndex,
      //   onTap: _onBottomNavigationTapped,
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Symbols.account_balance),
      //       label: 'Group',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Symbols.list),
      //       label: 'History',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Symbols.paid),
      //       label: 'Item',
      //     ),
      //   ],
      // ),
    );
  }
}
