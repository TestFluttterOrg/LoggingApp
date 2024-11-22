import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logging_app/core/routes/app_routes.dart';
import 'package:logging_app/core/di/dependency_injection.dart' as di;
import 'package:logging_app/feature/presentation/splash/bloc/splash_bloc.dart';
import 'package:logging_app/feature/presentation/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.vf<SplashBloc>()..initialize()),
      ],
      child: const _SplashForm(),
    );
  }
}

class _SplashForm extends StatelessWidget {
  const _SplashForm();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashBloc, SplashState>(
      listenWhen: (prev, current) => prev.uiEvent != current.uiEvent,
      listener: (context, state) {
        final event = state.uiEvent;
        switch (event) {
          case SplashUIEvent.goToMain:
            context.pushReplacement(AppRoutes.main);
            break;
          default:
            break;
        }
      },
      child: Container(
        color: Colors.blue,
        child: Center(
          child: SizedBox(
            width: 30.h,
            height: 30.h,
            child: CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2.h,
            ),
          ),
        ),
      ),
    );
  }
}
