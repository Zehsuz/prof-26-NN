import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';

import '../pages/login_page.dart';
/// Назначение: запуск первого экрана
/// Дата создания: 26.05.2026
/// Создал: Захар
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: .new(390, 884),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: .light().copyWith(
          extensions: [CustomTheme(palette: LightPalette())],
        ),
        home: LoginPage(),
      ),
    );
  }
}
