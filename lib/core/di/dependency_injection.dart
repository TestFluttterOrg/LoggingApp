import 'package:get_it/get_it.dart';
import 'package:logging_app/feature/data/datasource/impl/log_datasource_impl.dart';
import 'package:logging_app/feature/data/datasource/log_datasource.dart';
import 'package:logging_app/feature/data/repository/app_datasource_impl.dart';
import 'package:logging_app/feature/data/service/database_service.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';
import 'package:logging_app/feature/presentation/main/bloc/main_bloc.dart';
import 'package:logging_app/feature/presentation/splash/bloc/splash_bloc.dart';

final GetIt vf = GetIt.instance;

Future<void> init() async {
  final database = await DatabaseService().database;

  //Datasource
  vf.registerLazySingleton<LogDataSource>(
    () => LogDataSourceImpl(
      database: database,
    ),
  );

  //Repository
  vf.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(
      logDataSource: vf.call(),
    ),
  );

  //BLOC
  vf.registerFactory<SplashBloc>(
    () => SplashBloc(),
  );
  vf.registerLazySingleton<MainBloc>(
    () => MainBloc(
      appRepository: vf.call(),
    ),
  );
}
