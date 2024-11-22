import 'package:logging_app/feature/data/datasource/log_datasource.dart';
import 'package:logging_app/feature/domain/model/button_model.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';

class AppRepositoryImpl extends AppRepository {
  final LogDataSource logDataSource;

  AppRepositoryImpl({
    required this.logDataSource,
  });

  @override
  Future<List<ButtonModel>> getButtonList() async {
    //await Future.delayed(const Duration(seconds: 1));
    final list = <ButtonModel>[];
    for (var i = 1; i <= 4; i++) {
      final label = "Button $i";
      list.add(
        ButtonModel(
          label: label,
          id: label,
        ),
      );
    }
    return list;
  }
}
