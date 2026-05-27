import 'package:application/presentation/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

void main() {
  Logger.root.level = .ALL;
  Logger.root.onRecord.listen((log) => print(log.message));

  runApp(App());
}
