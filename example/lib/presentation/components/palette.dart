import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';
import 'package:widgetbook/widgetbook.dart';

class PaletteUseCase extends WidgetbookUseCase {
  PaletteUseCase()
    : super(name: 'Palette', builder: (_) => throw UnimplementedError());

  @override
  Widget build(BuildContext context) {
    Map itemsMap = {
      'primary': context.palette.primary,
      'secondary': context.palette.secondary,
      'tertiary': context.palette.tertiary,
      'error': context.palette.error,
      'white': context.palette.white,
      'black': context.palette.black,
      'darkenWhite': context.palette.darkenWhite,
    };
    return SingleChildScrollView(
      child: Column(
        spacing: 20.h,
        children: [
          for (var item in itemsMap.entries) ...{
            Text(item.key),
            Column(
              spacing: 5.h,
              children: [
                Container(color: item.value, width: 100.r, height: 100.r),
              ],
            ),
          },
        ],
      ),
    );
  }
}
