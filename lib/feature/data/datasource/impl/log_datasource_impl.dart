import 'package:logging_app/feature/data/constants/db_constants.dart';
import 'package:logging_app/feature/data/datasource/log_datasource.dart';
import 'package:logging_app/feature/domain/entity/data/log/log_entity.dart';
import 'package:logging_app/feature/domain/entity/result_entity.dart';
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

  @override
  Future<ResultEntity<int>> saveLog(LogEntity data) async {
    try {
      final result = await database.rawInsert(
        '''INSERT INTO ${DBConstants.logColTblName} (
        ${DBConstants.logColName},
        ${DBConstants.logColMessage},
        ${DBConstants.logColCreatedAt}
        ) VALUES (?, ?, ?)''',
        [
          data.name,
          data.message,
          data.createdAt,
        ],
      );
      return ResultEntity(
        isSuccess: true,
        message: "Log saved successfully",
        data: result,
      );
    } catch (_) {
      return const ResultEntity(
        isSuccess: false,
        message: "Log save failed",
      );
    }
  }

  @override
  Future<ResultEntity<List<LogEntity>>> getLogs() async {
    try {
      final result = await database.rawQuery(
          "SELECT * FROM ${DBConstants.logColTblName} ORDER BY ${DBConstants.logColId} DESC");
      final data = result.map((e) => LogEntity.fromJson(e)).toList();
      if (data.isNotEmpty) {
        return ResultEntity(
          isSuccess: true,
          data: data,
        );
      }
      return const ResultEntity(
        isSuccess: false,
        message: "No data found",
      );
    } catch (_) {
      return const ResultEntity(
        isSuccess: false,
        message: "Failed to get logs",
      );
    }
  }
}
