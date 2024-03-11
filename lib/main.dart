import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'application.dart';
import 'database.dart';
import 'shared/logger.dart';

final _logger = getLogger();

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  final database = AppDatabase();
  await database
      .into(database.investItem)
      .insert(InvestItemCompanion.insert(itemName: '테스트'));
  List items = await database.select(database.investItem).get();
  _logger.d('Items: $items');

  runApp(
    const ProviderScope(
      child: Application(),
    ),
  );
}
