import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

import '../pages/auth_page.dart';

/// Назначение: главный виджет приложения
/// Дата создания: 25.05.2026
/// Создал: Захар
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: .new(390, 884),
      child: MaterialApp(
        theme: .light().copyWith(
          extensions: [CustomTheme(palette: LightPalette())],
        ),
        debugShowCheckedModeBanner: false,
        home: AuthPage(),
      ),
    );
  }
}
