import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging_app/feature/domain/model/log_model.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';
import 'package:logging_app/feature/presentation/main/bloc/main_state.dart';

class MainBloc extends Cubit<MainState> {
  final AppRepository appRepository;

  MainBloc({
    required this.appRepository,
  }) : super(MainInitialState());

  Timer? _timer;

  void initialize() async {
    if (state is MainInitialState) {
      emit(MainLoadingState());

      //Get button list
      final buttonList = await appRepository.getButtonList();
      emit(MainLoadedState(buttonList: buttonList));
    }
  }

  void onButtonPressed(String buttonId) async {
    final data = LogModel(
      name: buttonId,
      message: "$buttonId pressed",
      createdAt: DateTime.now(),
    );
    final result = await appRepository.saveLog(data);
    final message = result.isSuccess
        ? "${data.name} press has been logged!"
        : "${data.name} press logging failed";
    _startMessageTimer(message, 2);
  }

  void _startMessageTimer(String message, int duration) {
    if (state is MainLoadedState) {
      emit((state as MainLoadedState).copyWith(message: message));
    }
    _timer?.cancel();
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        final int currentDuration = duration - timer.tick;
        if (currentDuration <= 0) {
          if (state is MainLoadedState) {
            emit((state as MainLoadedState).copyWith(message: ""));
          }
          _timer?.cancel();
        }
      },
    );
  }
}
