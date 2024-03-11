import 'package:drift/drift.dart';

class InvestItem extends Table {
  IntColumn get itemIdx => integer().autoIncrement()();
  TextColumn get itemName => text().withLength(min: 1, max: 10)();
}
