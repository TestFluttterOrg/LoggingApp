import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';
import 'package:logging_app/feature/presentation/log_history/bloc/log_history_state.dart';

class LogHistoryBloc extends Cubit<LogHistoryState> {
  final AppRepository appRepository;

  LogHistoryBloc({
    required this.appRepository,
  }) : super(LogHistoryInitialState());

  void initialize() async {
    emit(LogHistoryLoadingState());

    //Get Log History
    final result = await appRepository.getLogHistory();
    if (result.isSuccess) {
      emit(LogHistoryLoadedState(logList: result.data ?? []));
    } else {
      emit(LogHistoryErrorState(message: result.message));
    }
  }

  void deleteLogHistory() async {
    await appRepository.deleteLogs();
    initialize();
  }
}
