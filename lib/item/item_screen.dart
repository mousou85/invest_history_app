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
    return Scaffold(
      body: ListView(
        children: itemSampleData
            .map(
              (item) => ListItem(
                itemName: item['name'],
                itemType: item['type'],
                createdAt: item['createdAt'],
              ),
            )
            .toList(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: IconButton(
          icon: const Icon(Icons.add, color: Colors.white),
          iconSize: 40,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            padding: MaterialStateProperty.all(const EdgeInsets.all(10)),
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
