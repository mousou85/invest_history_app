import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'invest_item/providers.dart';
import 'shared/logger.dart';

part 'database.g.dart';

final _logger = getLogger();

@DriftDatabase(tables: [InvestItem])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final folder = await getApplicationDocumentsDirectory();
    final file = File(p.join(folder.path, 'db.sqlite'));
    _logger.d('Database file: ${file.path}');

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachedDb = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachedDb;
    _logger.d('Cached database directory: $cachedDb');

    return NativeDatabase.createInBackground(file);
  });
}
