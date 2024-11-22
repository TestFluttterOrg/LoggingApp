import 'package:logging_app/feature/domain/entity/data/log/log_entity.dart';
import 'package:logging_app/feature/domain/entity/result_entity.dart';

abstract class LogDataSource {
  Future<ResultEntity<int>> saveLog(LogEntity data);
  Future<ResultEntity<List<LogEntity>>> getLogs();
  Future<ResultEntity> deleteLogs();
}