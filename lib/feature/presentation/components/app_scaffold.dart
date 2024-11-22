import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppScaffold extends StatelessWidget {
  final AppBar? appBar;
  final Widget? bottomBar;
  final Color? backgroundColor;
  final Widget body;

  const AppScaffold({
    required this.body,
    this.appBar,
    this.bottomBar,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double safePadding = MediaQuery.paddingOf(context).top;
    final bNavHeight = 55.h;
    final appBarHeight = appBar?.preferredSize.height ?? 0;
    final bottomNavHeight = bottomBar != null ? bNavHeight : 0;
    final mediaQuery = MediaQuery.of(context).size;
    final width = mediaQuery.width;
    final height = mediaQuery.height;
    final containerHeight = height - (safePadding + appBarHeight + bottomNavHeight);
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              //Use for hiding keyboard once tap somewhere else on the screen.
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: Container(
              width: width,
              height: containerHeight,
              color: backgroundColor,
              child: body,
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomBar,
    );
  }
}