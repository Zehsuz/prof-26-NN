import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';
import 'package:widgetbook/widgetbook.dart';

class CustomInputUseCase extends WidgetbookUseCase with CustomLogger {
  CustomInputUseCase()
    : super(name: 'CustomInput', builder: (_) => throw UnimplementedError());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 20.h,
        children: [
          CustomInput(
            enabled: context.knobs.boolean(label: 'active', initialValue: true),
            controller: .new(
              text: context.knobs.stringOrNull(
                label: 'controller',
                initialValue: 'controller',
              ),
            ),
            title: context.knobs.stringOrNull(
              label: 'title',
              initialValue: 'title',
            ),
            hint: context.knobs.stringOrNull(
              label: 'hint',
              initialValue: 'hint',
            ),
            error: context.knobs.stringOrNull(
              label: 'error',
              initialValue: 'error',
            ),
            type: context.knobs.object.dropdown(
              label: 'Type',
              options: InputType.values,
            ),
          ),
        ],
      ),
    );
  }
}
