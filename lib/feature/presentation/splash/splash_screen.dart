import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logging_app/feature/presentation/components/app_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.h,
        ),
      ),
    );
  }
}
