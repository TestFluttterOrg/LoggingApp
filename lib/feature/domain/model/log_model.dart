import 'package:equatable/equatable.dart';

class LogModel extends Equatable {
  final String id;
  final String name;
  final String message;
  final DateTime? createdAt;

  const LogModel({
    this.id = "",
    this.name = "",
    this.message = "",
    this.createdAt,
  });

  LogModel copyWith({
    String? id,
    String? name,
    String? message,
    DateTime? createAt,
  }) =>
      LogModel(
        id: id ?? this.id,
        name: name ?? this.name,
        message: message ?? this.message,
        createdAt: createAt ?? this.createdAt,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        message,
        createdAt,
      ];
}
