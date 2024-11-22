import 'package:freezed_annotation/freezed_annotation.dart';

part 'log_entity.g.dart';

part 'log_entity.freezed.dart';

@freezed
class LogEntity with _$LogEntity {
  factory LogEntity({
    int? id,
    String? name,
    String? message,
    String? createdAt,
  }) = _LogEntity;

  factory LogEntity.fromJson(Map<String, dynamic> json) => _$LogEntityFromJson(json);
}
