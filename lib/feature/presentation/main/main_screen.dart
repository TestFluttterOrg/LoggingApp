import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 20.h,
          horizontal: 20.w,
        ),
        child: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is MainLoadingState) {
              return const _LoadingView();
            } else if (state is MainLoadedState) {
              return const _ButtonListView();
            }
            return const SizedBox();
          },
        ),
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
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        final currentState = state as MainLoadedState;
        final list = currentState.buttonList;
        return ListView.separated(
          itemCount: list.length,
          itemBuilder: (context, i) {
            final data = list[i];
            return AppButton(
              onPressed: () {},
              label: data.label,
            );
          },
          separatorBuilder: (context, i) {
            return SizedBox(height: 20.h);
          },
        );
      },
    );
  }
}
