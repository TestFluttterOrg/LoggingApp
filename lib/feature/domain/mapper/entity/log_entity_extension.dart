import 'package:intl/intl.dart';
import 'package:logging_app/core/constants/app_constants.dart';
import 'package:logging_app/feature/domain/entity/data/log/log_entity.dart';
import 'package:logging_app/feature/domain/model/log_model.dart';

extension LogEntityExtension on LogEntity {
  LogModel mapToLogModel() {
    final data = this;
    return LogModel(
      id: data.id ?? 0,
      name: data.name ?? "",
      message: data.message ?? "",
      createdAt: data.createdAt != null
          ? DateFormat(AppConstants.dateTimeFormat).parse(data.createdAt!)
          : null,
    );
  }
}
