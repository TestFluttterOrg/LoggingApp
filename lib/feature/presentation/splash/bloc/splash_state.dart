import 'package:equatable/equatable.dart';
import 'package:logging_app/feature/presentation/splash/bloc/splash_bloc.dart';

class SplashState extends Equatable {
  final SplashUIEvent uiEvent;

  const SplashState({
    this.uiEvent = SplashUIEvent.initial,
  });

  SplashState copyWith({
    SplashUIEvent? uiEvent,
  }) =>
      SplashState(
        uiEvent: uiEvent ?? this.uiEvent,
      );

  @override
  List<Object?> get props => [
        uiEvent,
      ];
}
