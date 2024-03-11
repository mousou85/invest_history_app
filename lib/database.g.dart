// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $InvestItemTable extends InvestItem
    with TableInfo<$InvestItemTable, InvestItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InvestItemTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _itemIdxMeta =
      const VerificationMeta('itemIdx');
  @override
  late final GeneratedColumn<int> itemIdx = GeneratedColumn<int>(
      'item_idx', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _itemNameMeta =
      const VerificationMeta('itemName');
  @override
  late final GeneratedColumn<String> itemName = GeneratedColumn<String>(
      'item_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 10),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [itemIdx, itemName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'invest_item';
  @override
  VerificationContext validateIntegrity(Insertable<InvestItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('item_idx')) {
      context.handle(_itemIdxMeta,
          itemIdx.isAcceptableOrUnknown(data['item_idx']!, _itemIdxMeta));
    }
    if (data.containsKey('item_name')) {
      context.handle(_itemNameMeta,
          itemName.isAcceptableOrUnknown(data['item_name']!, _itemNameMeta));
    } else if (isInserting) {
      context.missing(_itemNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {itemIdx};
  @override
  InvestItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InvestItemData(
      itemIdx: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}item_idx'])!,
      itemName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}item_name'])!,
    );
  }

  @override
  $InvestItemTable createAlias(String alias) {
    return $InvestItemTable(attachedDatabase, alias);
  }
}

class InvestItemData extends DataClass implements Insertable<InvestItemData> {
  final int itemIdx;
  final String itemName;
  const InvestItemData({required this.itemIdx, required this.itemName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['item_idx'] = Variable<int>(itemIdx);
    map['item_name'] = Variable<String>(itemName);
    return map;
  }

  InvestItemCompanion toCompanion(bool nullToAbsent) {
    return InvestItemCompanion(
      itemIdx: Value(itemIdx),
      itemName: Value(itemName),
    );
  }

  factory InvestItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InvestItemData(
      itemIdx: serializer.fromJson<int>(json['itemIdx']),
      itemName: serializer.fromJson<String>(json['itemName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'itemIdx': serializer.toJson<int>(itemIdx),
      'itemName': serializer.toJson<String>(itemName),
    };
  }

  InvestItemData copyWith({int? itemIdx, String? itemName}) => InvestItemData(
        itemIdx: itemIdx ?? this.itemIdx,
        itemName: itemName ?? this.itemName,
      );
  @override
  String toString() {
    return (StringBuffer('InvestItemData(')
          ..write('itemIdx: $itemIdx, ')
          ..write('itemName: $itemName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(itemIdx, itemName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InvestItemData &&
          other.itemIdx == this.itemIdx &&
          other.itemName == this.itemName);
}

class InvestItemCompanion extends UpdateCompanion<InvestItemData> {
  final Value<int> itemIdx;
  final Value<String> itemName;
  const InvestItemCompanion({
    this.itemIdx = const Value.absent(),
    this.itemName = const Value.absent(),
  });
  InvestItemCompanion.insert({
    this.itemIdx = const Value.absent(),
    required String itemName,
  }) : itemName = Value(itemName);
  static Insertable<InvestItemData> custom({
    Expression<int>? itemIdx,
    Expression<String>? itemName,
  }) {
    return RawValuesInsertable({
      if (itemIdx != null) 'item_idx': itemIdx,
      if (itemName != null) 'item_name': itemName,
    });
  }

  InvestItemCompanion copyWith({Value<int>? itemIdx, Value<String>? itemName}) {
    return InvestItemCompanion(
      itemIdx: itemIdx ?? this.itemIdx,
      itemName: itemName ?? this.itemName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (itemIdx.present) {
      map['item_idx'] = Variable<int>(itemIdx.value);
    }
    if (itemName.present) {
      map['item_name'] = Variable<String>(itemName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InvestItemCompanion(')
          ..write('itemIdx: $itemIdx, ')
          ..write('itemName: $itemName')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  late final $InvestItemTable investItem = $InvestItemTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [investItem];
}
