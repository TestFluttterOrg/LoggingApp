import 'package:logging_app/feature/data/constants/db_constants.dart';
import 'package:logging_app/feature/data/datasource/log_datasource.dart';
import 'package:sqflite/sqflite.dart';

class LogDataSourceImpl extends LogDataSource {
  final Database database;

  LogDataSourceImpl({
    required this.database,
  });

  static Future<void> createTable(Database database) async {
    await database.execute("""CREATE TABLE IF NOT EXISTS ${DBConstants.logColTblName} (
        "${DBConstants.logColId}" INTEGER PRIMARY KEY AUTOINCREMENT,
        "${DBConstants.logColName}" TEXT NOT NULL,
        "${DBConstants.logColMessage}" TEXT NOT NULL,
        "${DBConstants.logColCreatedAt}" TEXT NOT NULL
        );""");
  }
}
