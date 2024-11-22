import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging_app/core/routes/routers.dart';
import 'package:logging_app/core/di/dependency_injection.dart' as di;
import 'package:logging_app/feature/presentation/main/bloc/main_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //Set to portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    //Set Status bar Color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.blue,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
    );

    return MultiBlocProvider(
      providers: [
        //Global BLOCs should store here
        BlocProvider(create: (_) => di.vf<MainBloc>()),
      ],
      child: ScreenUtilInit(
        builder: (context, widget) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Logging App",
            theme: ThemeData(
              primarySwatch: Colors.blue,
              appBarTheme: AppBarTheme(
                color: Colors.blue,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 16.h,
                  fontWeight: FontWeight.w600,
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
            ),
            routerConfig: Routes.routers,
          );
        },
      ),
    );
  }
}
