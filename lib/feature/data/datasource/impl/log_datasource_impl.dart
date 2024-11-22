import 'package:logging_app/feature/data/constants/db_constants.dart';
import 'package:logging_app/feature/data/datasource/log_datasource.dart';
import 'package:logging_app/feature/domain/entity/data/log/log_entity.dart';
import 'package:logging_app/feature/domain/model/result_model.dart';
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
  Future<ResultModel<int>> saveLog(LogEntity data) async {
    try {
      final result = await database.rawInsert(
        '''INSERT INTO (
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
      return ResultModel(
        isSuccess: true,
        message: "Log saved successfully",
        data: result,
      );
    } catch (_) {
      return const ResultModel(
        isSuccess: false,
        message: "Log save failed",
      );
    }
  }

  @override
  Future<ResultModel<List<LogEntity>>> getLogs() async {
    try {
      final result = await database.rawQuery(
          "SELECT * FROM ${DBConstants.logColTblName} ORDER BY ${DBConstants.logColId} DESC");
      final data = result.map((e) => LogEntity.fromJson(e)).toList();
      return ResultModel(
        isSuccess: true,
        data: data,
      );
    } catch (_) {
      return const ResultModel(
        isSuccess: false,
        message: "Failed to get logs",
      );
    }
  }
}
