import 'package:equatable/equatable.dart';
import 'package:logging_app/feature/domain/model/log_model.dart';

abstract class LogHistoryState extends Equatable {}

class LogHistoryInitialState extends LogHistoryState {
  @override
  List<Object?> get props => [];
}

class LogHistoryLoadingState extends LogHistoryState {
  @override
  List<Object?> get props => [];
}

class LogHistoryLoadedState extends LogHistoryState {
  final List<LogModel> logList;

  LogHistoryLoadedState({required this.logList});

  @override
  List<Object?> get props => [logList];
}

class LogHistoryErrorState extends LogHistoryState {
  final String message;

  LogHistoryErrorState({required this.message});

  @override
  List<Object?> get props => [message];
}
