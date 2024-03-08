import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'application.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting();

  runApp(
    const ProviderScope(
      child: Application(),
    ),
  );
}
