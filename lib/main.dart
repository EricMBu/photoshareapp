import 'package:flutter/material.dart';
import 'package:photoshare/application/app_widget.dart';
import 'package:photoshare/infrastructure/services/hive_handler.dart';

Future<void> main() async {
  await HiveHandler.instance.init();

  runApp(const AppWidget());
}
