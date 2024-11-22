import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:logging_app/core/routes/app_routes.dart';
import 'package:logging_app/feature/presentation/components/app_button.dart';
import 'package:logging_app/feature/presentation/components/app_scaffold.dart';
import 'package:logging_app/feature/presentation/main/bloc/main_bloc.dart';
import 'package:logging_app/feature/presentation/main/bloc/main_state.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    bloc.initialize();
    return AppScaffold(
      appBar: AppBar(
        title: const Text("LOGGING APP"),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.logHistory);
            },
            icon: Icon(
              Icons.list,
              size: 30.h,
            ),
          ),
        ],
      ),
      body: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          if (state is MainLoadingState) {
            return const _LoadingView();
          } else if (state is MainLoadedState) {
            return const _ButtonListView();
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 30.h,
        height: 30.h,
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeWidth: 2.h,
        ),
      ),
    );
  }
}

class _ButtonListView extends StatelessWidget {
  const _ButtonListView();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<MainBloc>();
    return Stack(
      children: [
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: BlocBuilder<MainBloc, MainState>(
            buildWhen: (prev, current) {
              if (prev is MainLoadedState && current is MainLoadedState) {
                return prev.buttonList != current.buttonList;
              }
              return false;
            },
            builder: (context, state) {
              if (state is MainLoadedState) {
                final buttonList = state.buttonList;
                return ListView.separated(
                  itemCount: buttonList.length,
                  itemBuilder: (context, i) {
                    final data = buttonList[i];
                    return AppButton(
                      onPressed: () {
                        bloc.onButtonPressed(data.id);
                      },
                      label: data.label,
                    );
                  },
                  separatorBuilder: (context, i) {
                    return SizedBox(height: 20.h);
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: BlocBuilder<MainBloc, MainState>(
            buildWhen: (prev, current) {
              if (prev is MainLoadedState && current is MainLoadedState) {
                return prev.message != current.message;
              }
              return false;
            },
            builder: (context, state) {
              if (state is MainLoadedState) {
                if (state.message.isNotEmpty) {
                  return Container(
                    color: Colors.black87,
                    height: 40.h,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Text(
                      state.message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11.h,
                      ),
                    ),
                  );
                }
              }
              return const SizedBox();
            },
          ),
        )
      ],
    );
  }
}
