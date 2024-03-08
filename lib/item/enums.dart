import 'package:flutter/material.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';

/// 상품 종류 enum
enum ItemTypes {
  cash('cash', '현금', Symbols.money),
  deposit('deposit', '예/적금', Symbols.savings),
  trade('stock', '주식', Symbols.monitoring),
  blockchain('blockchain', '블록체인', Symbols.currency_bitcoin);

  final String id;
  final String label;
  final IconData icon;

  const ItemTypes(this.id, this.label, this.icon);
}
