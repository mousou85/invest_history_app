import 'invest_item/enums.dart';

/// 투자 상품 샘플 데이터
final List<Map<String, dynamic>> itemSampleData = [
  {
    'name': '현금',
    'type': ItemTypes.cash,
    'createdAt': DateTime(2024, 1, 1, 13, 23, 59),
  },
  {
    'name': '은행 적금',
    'type': ItemTypes.deposit,
  },
];
