import 'package:flutter/material.dart';
import 'package:logging_app/feature/presentation/components/app_scaffold.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text("LOGGING APP"),
      ),
      body: Container(),
    );
  }
}
