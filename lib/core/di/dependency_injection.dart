import 'package:get_it/get_it.dart';
import 'package:logging_app/feature/presentation/splash/bloc/splash_bloc.dart';

final GetIt vf = GetIt.instance;

Future<void> init() async {
  //BLOC
  vf.registerFactory<SplashBloc>(
    () => SplashBloc(),
  );
}
