import 'package:equatable/equatable.dart';
import 'package:logging_app/feature/domain/model/button_model.dart';

abstract class MainState extends Equatable {}

class MainInitialState extends MainState {
  @override
  List<Object?> get props => [];
}

class MainLoadingState extends MainState {
  @override
  List<Object?> get props => [];
}

class MainLoadedState extends MainState {
  final List<ButtonModel> buttonList;

  MainLoadedState({
    required this.buttonList,
  });

  @override
  List<Object?> get props => [
        buttonList,
      ];
}
