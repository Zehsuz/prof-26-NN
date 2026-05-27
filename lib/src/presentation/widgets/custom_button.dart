import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:ui_kit/src/presentation/theme/extension.dart';

/// Назначение: определение состояний Button
/// Дата создания: 26.05.2026
/// Создал: Захар
enum ButtonType { primary, secondary, destructive }
/// Назначение: виджет кнопки
/// Дата создания: 26.05.2026
/// Создал: Захар
class CustomButton extends StatefulWidget {
  final Function()? onPressed;
  final String text;
  final ButtonType type;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.type,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with LoggableState, CustomLogger {
  @override
  Widget build(BuildContext context) {
    logBuild();
    logDebug(
      operation: 'build()',
      message: 'кнопка типа ${widget.type} собрана',
    );
    return FilledButton(
      onPressed: widget.onPressed != null
          ? () {
              logInfo(
                operation: 'onPressed()',
                message: 'кнопка типа ${widget.type} нажата',
              );
              widget.onPressed?.call();
            }
          : null,
      style: FilledButton.styleFrom(
        disabledBackgroundColor: Colors.grey,
        backgroundColor: widget.type == .primary
            ? context.palette.primary
            : widget.type == .destructive
            ? context.palette.error
            : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: .circular(8.r),
          side: widget.type == .secondary
              ? BorderSide(width: 2.r, color: context.palette.primary)
              : .none,
        ),
        padding: .all(14.r),
      ),
      child: Center(
        child: Text(
          widget.text,
          style: context.styles.bodyMediumRegular16.copyWith(
            color: widget.type == .secondary
                ? context.palette.primary
                : context.palette.white,
          ),
        ),
      ),
    );
  }
}
