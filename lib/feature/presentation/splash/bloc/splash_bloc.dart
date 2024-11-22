import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging_app/feature/presentation/splash/bloc/splash_state.dart';

enum SplashUIEvent {
  initial,
  goToMain,
}

class SplashBloc extends Cubit<SplashState> {
  SplashBloc() : super(const SplashState());

  void initialize() async {
    await Future.delayed(const Duration(seconds: 2));

    //Pre load data here

    emit(state.copyWith(uiEvent: SplashUIEvent.goToMain));
    emit(state.copyWith(uiEvent: SplashUIEvent.initial));
  }
}