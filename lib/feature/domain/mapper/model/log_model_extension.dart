import 'package:logging_app/core/constants/app_constants.dart';
import 'package:logging_app/feature/domain/entity/data/log/log_entity.dart';
import 'package:logging_app/feature/domain/model/log_model.dart';
import 'package:intl/intl.dart';

extension LogModelExtension on LogModel {
  LogEntity mapToLogEntity() {
    final data = this;
    final createdAt = data.createdAt ?? DateTime.now();
    return LogEntity(
      id: data.id,
      name: data.name,
      message: data.message,
      createdAt: DateFormat(AppConstants.dateTimeFormat).format(createdAt),
    );
  }
}