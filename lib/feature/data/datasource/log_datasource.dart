import 'package:logging_app/feature/domain/entity/data/log/log_entity.dart';
import 'package:logging_app/feature/domain/model/result_model.dart';

abstract class LogDataSource {
  Future<ResultModel<int>> saveLog(LogEntity data);
  Future<ResultModel<List<LogEntity>>> getLogs();
}