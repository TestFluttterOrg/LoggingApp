import 'package:equatable/equatable.dart';

class LogModel extends Equatable {
  final int id;
  final String name;
  final String message;
  final DateTime? createdAt;

  const LogModel({
    this.id = 0,
    this.name = "",
    this.message = "",
    this.createdAt,
  });

  LogModel copyWith({
    int? id,
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
