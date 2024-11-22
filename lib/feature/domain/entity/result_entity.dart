import 'package:equatable/equatable.dart';

class ResultEntity<T> extends Equatable {
  final bool isSuccess;
  final String message;
  final T? data;

  const ResultEntity({
    this.isSuccess = false,
    this.message = "",
    this.data,
  });

  @override
  List<Object?> get props => [
    isSuccess,
    message,
    data,
  ];
}
