import 'dart:math';

import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import '../../shared/helpers.dart';
import '../enums.dart';

/// 상품 목록 아이템 위젯
class ListItem extends StatelessWidget {
  /// 상품명
  final String itemName;

  /// 상품 타입
  final ItemTypes itemType;

  /// 생성일
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
              createdAt: createdAt,
            ),
          ),
        ],
      ),
    );
  }
}

/// 상품 목록 아이템 아이콘 위젯
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

/// 상품 목록 아이템 상세 정보 위젯
class _ItemDetail extends StatelessWidget {
  /// 상품명
  final String itemName;

  /// 상품 타입
  final ItemTypes itemTypes;

  /// 생성일
  final DateTime? createdAt;

  const _ItemDetail({
    required this.itemName,
    required this.itemTypes,
    this.createdAt,
  });

  /// 상품명 영역 생성
  Widget _buildItemName() {
    return Row(
      children: [
        Expanded(
          child: Text(
            itemName,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        const Icon(
          Symbols.edit_square,
          size: 20,
          weight: 700,
          color: Colors.grey,
        ),
      ],
    );
  }

  /// 상품 설명 영역 생성
  Widget _buildDescription() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(itemTypes.label),
        createdAt == null
            ? const SizedBox()
            : Row(
                children: [
                  const Icon(Symbols.calendar_add_on, size: 18),
                  Text(Helpers.dateFormat(createdAt!)),
                ],
              ),
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
