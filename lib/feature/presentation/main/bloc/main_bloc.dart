import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';
import 'package:logging_app/feature/presentation/main/bloc/main_state.dart';

class MainBloc extends Cubit<MainState> {
  final AppRepository appRepository;

  MainBloc({
    required this.appRepository,
  }) : super(MainInitialState());

  void initialize() async {
    if (state is MainInitialState) {
      emit(MainLoadingState());

      //Get button list
      final buttonList = await appRepository.getButtonList();
      emit(MainLoadedState(buttonList: buttonList));
    }
  }

  void onButtonPressed(String id) {

  }
}
