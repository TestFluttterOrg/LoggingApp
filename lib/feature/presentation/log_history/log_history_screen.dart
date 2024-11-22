import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:logging_app/core/constants/app_constants.dart';
import 'package:logging_app/core/di/dependency_injection.dart' as di;
import 'package:logging_app/feature/domain/model/log_model.dart';
import 'package:logging_app/feature/presentation/components/app_button.dart';
import 'package:logging_app/feature/presentation/components/app_scaffold.dart';
import 'package:logging_app/feature/presentation/log_history/bloc/log_history_bloc.dart';
import 'package:logging_app/feature/presentation/log_history/bloc/log_history_state.dart';

class LogHistoryScreen extends StatelessWidget {
  const LogHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.vf<LogHistoryBloc>()..initialize()),
      ],
      child: const _LogHistoryForm(),
    );
  }
}

class _LogHistoryForm extends StatelessWidget {
  const _LogHistoryForm();

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text("LOG HISTORY"),
      ),
      body: BlocBuilder<LogHistoryBloc, LogHistoryState>(
        builder: (context, state) {
          if (state is LogHistoryLoadingState) {
            return const _LoadingView();
          } else if (state is LogHistoryLoadedState) {
            return _LoadedView(logList: state.logList);
          } else if (state is LogHistoryErrorState) {
            return _ErrorView(message: state.message);
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

class _ErrorView extends StatelessWidget {
  final String message;

  const _ErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.black,
              fontSize: 14.h,
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _LoadedView extends StatelessWidget {
  final List<LogModel> logList;

  const _LoadedView({required this.logList});

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Container(
        color: Colors.blue.shade100,
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        child: ListView.separated(
          itemCount: logList.length,
          itemBuilder: (context, i) {
            final data = logList[i];
            return Card(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.message,
                      style: TextStyle(
                        fontSize: 11.5.h,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (data.createdAt != null)
                      Text(
                        DateFormat(AppConstants.dateTimeFormat).format(data.createdAt!),
                        style: TextStyle(
                          fontSize: 11.h,
                          color: Colors.blue.shade700,
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, i) {
            return SizedBox(height: 10.h);
          },
        ),
      ),
    );
  }
}
