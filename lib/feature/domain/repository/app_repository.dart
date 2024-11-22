import 'package:logging_app/feature/domain/model/button_model.dart';
import 'package:logging_app/feature/domain/model/result_model.dart';

abstract class AppRepository {
  Future<List<ButtonModel>> getButtonList();
}