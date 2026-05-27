import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomButtonUseCase extends WidgetbookUseCase with CustomLogger {
  CustomButtonUseCase()
    : super(name: 'CustomButton', builder: (_) => throw UnimplementedError());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20.h,
        children: [
          CustomButton(
            onPressed:
                context.knobs.boolean(label: 'active', initialValue: true)
                ? () {
                    logDebug(
                      operation: 'onPressed',
                      message: 'кнопка нажата в сторибуке',
                    );
                  }
                : null,
            text: context.knobs.string(
              label: 'Text',
              initialValue: 'ButtonText',
            ),
            type: context.knobs.object.dropdown(
              label: 'Type',
              options: ButtonType.values,
            ),
          ),
        ],
      ),
    );
  }
}
