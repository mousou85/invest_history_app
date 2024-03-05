import 'package:flutter/material.dart';

import 'enums.dart';
import 'widgets.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListItem(
          itemName: 'item1',
          itemType: ItemTypes.cash,
        ),
        ListItem(
          itemName: 'item2',
          itemType: ItemTypes.deposit,
        ),
      ],
    );
  }
}
