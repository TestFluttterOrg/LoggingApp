import 'package:logging_app/feature/data/datasource/log_datasource.dart';
import 'package:logging_app/feature/domain/mapper/entity/log_entity_extension.dart';
import 'package:logging_app/feature/domain/mapper/model/log_model_extension.dart';
import 'package:logging_app/feature/domain/model/button_model.dart';
import 'package:logging_app/feature/domain/model/log_model.dart';
import 'package:logging_app/feature/domain/model/result_model.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LogDataSource logDataSource;

  AppRepositoryImpl({
    required this.logDataSource,
  });

  @override
  Future<List<ButtonModel>> getButtonList() async {
    //await Future.delayed(const Duration(seconds: 1));
    final list = <ButtonModel>[];
    for (var i = 1; i <= 4; i++) {
      final label = "Button $i";
      list.add(
        ButtonModel(
          label: label,
          id: label,
        ),
      );
    }
    return list;
  }

  @override
  Future<ResultModel<LogModel>> saveLog(LogModel data) async {
    final ent = data.mapToLogEntity();
    final result = await logDataSource.saveLog(ent);
    if (result.isSuccess) {
      final id = result.data ?? 0;
      return ResultModel(
        isSuccess: true,
        message: result.message,
        data: data.copyWith(
          id: id,
        ),
      );
    } else {
      return ResultModel(
        isSuccess: false,
        message: result.message,
      );
    }
  }

  @override
  Future<ResultModel<List<LogModel>>> getLogHistory() async {
    final result = await logDataSource.getLogs();
    if (result.isSuccess) {
      final data = result.data ?? [];
      final logList = data.map((e) => e.mapToLogModel()).toList();
      return ResultModel(
        isSuccess: true,
        data: logList,
      );
    } else {
      return ResultModel(
        isSuccess: false,
        message: result.message,
      );
    }
  }
}
