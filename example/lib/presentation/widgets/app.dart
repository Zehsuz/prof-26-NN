import 'package:example/presentation/components/palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';
import 'package:widgetbook/widgetbook.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      addons: [
        ViewportAddon([AndroidViewports.samsungGalaxyA50]),
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(
              name: 'Light',
              data: .light().copyWith(
                extensions: [CustomTheme(palette: LightPalette())],
              ),
            ),
          ],
        ),
        AlignmentAddon()
      ],
      appBuilder: (context, child) =>
          ScreenUtilInit(designSize: .new(390, 884), child: child),
      directories: [PaletteUseCase()],
    );
  }
}
