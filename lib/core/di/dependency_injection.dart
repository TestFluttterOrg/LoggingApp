import 'package:get_it/get_it.dart';
import 'package:logging_app/feature/data/repository/app_datasource_impl.dart';
import 'package:logging_app/feature/domain/repository/app_repository.dart';
import 'package:logging_app/feature/presentation/main/bloc/main_bloc.dart';
import 'package:logging_app/feature/presentation/splash/bloc/splash_bloc.dart';

final GetIt vf = GetIt.instance;

Future<void> init() async {
  //Datasource

  //Repository
  vf.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(),
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
