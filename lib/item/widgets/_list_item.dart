import 'dart:math';

import 'package:flutter/material.dart';

import '../enums.dart';

class ListItem extends StatelessWidget {
  final String itemName;
  final ItemTypes itemType;
  final DateTime? createdAt;

  const ListItem({
    super.key,
    required this.itemName,
    required this.itemType,
    this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _ItemIcon(itemType.icon),
          Expanded(
            child: _ItemDetail(
              itemName: itemName,
              itemTypes: itemType,
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemIcon extends StatelessWidget {
  final IconData iconData;

  const _ItemIcon(this.iconData);

  @override
  Widget build(BuildContext context) {
    final icon = Icon(iconData, weight: 700, size: 40);
    final backgroundColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return CircleAvatar(
      radius: 30,
      backgroundColor: backgroundColor,
      child: icon,
    );
  }
}

class _ItemDetail extends StatelessWidget {
  final String itemName;
  final ItemTypes itemTypes;
  final DateTime? createdAt;

  const _ItemDetail({
    required this.itemName,
    required this.itemTypes,
    this.createdAt,
  });

  Widget _buildItemName() {
    return Text(
      itemName,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemTypes.label),
        Text('456'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildItemName(),
          _buildDescription(),
        ],
      ),
    );
  }
}
