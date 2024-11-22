import 'package:equatable/equatable.dart';

class ButtonModel extends Equatable {
  final String id;
  final String label;

  const ButtonModel({
    this.id = "",
    this.label = "",
  });

  @override
  List<Object?> get props => [
        id,
        label,
      ];
}
