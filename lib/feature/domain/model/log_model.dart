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

  @override
  List<Object?> get props => [
        id,
        name,
        message,
        createdAt,
      ];
}
