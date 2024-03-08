import 'package:flutter/material.dart';

import '../sample_data.dart';
import 'widgets.dart';

/// 상품 화면
class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: itemSampleData
          .map(
            (item) => ListItem(
              itemName: item['name'],
              itemType: item['type'],
              createdAt: item['createdAt'],
            ),
          )
          .toList(),
    );
  }
}
