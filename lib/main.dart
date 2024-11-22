import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging_app/core/routes/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
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
                fontWeight: FontWeight.w400,
              ),
              iconTheme: IconThemeData(color: Colors.white),
            ),
          ),
          routerConfig: Routes.routers,
        );
      },
    );
  }
}
