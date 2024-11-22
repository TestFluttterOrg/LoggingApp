import 'package:flutter/material.dart';
import 'package:logging_app/feature/presentation/components/app_scaffold.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text("TEST"),
      ),
      body: Container(),
    );
  }
}
