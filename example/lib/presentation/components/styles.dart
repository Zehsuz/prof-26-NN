import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';
import 'package:widgetbook/widgetbook.dart';

class StylesUseCase extends WidgetbookUseCase {
  StylesUseCase()
    : super(name: 'Styles', builder: (_) => throw UnimplementedError());

  @override
  Widget build(BuildContext context) {
    Map itemsMap = {
      'screenHeaderBold24': context.styles.screenHeaderBold24,
      'subheaderSemiBold18': context.styles.subheaderSemiBold18,
      'bodyMediumRegular16': context.styles.bodyMediumRegular16,
      'bodySmallRegular14': context.styles.bodySmallRegular14,
      'fieldLabelSemiBold14': context.styles.fieldLabelSemiBold14,
    };
    return SingleChildScrollView(
      child: Column(
        spacing: 20.h,
        children: [
          for (var item in itemsMap.entries) ...{
            Text(item.key, style: item.value, textAlign: .center),
          },
        ],
      ),
    );
  }
}
