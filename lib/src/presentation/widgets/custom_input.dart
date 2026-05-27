import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:ui_kit/src/presentation/theme/extension.dart';

/// Назначение: определение состояний Input
/// Дата создания: 26.05.2026
/// Создал: Захар
enum InputType { base, password, search }

/// Назначение: виджет инпут
/// Дата создания: 26.05.2026
/// Создал: Захар
class CustomInput extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hint;
  final String? error;
  final bool enabled;
  final InputType type;

  const CustomInput({
    super.key,
    this.type = .base,
    required this.controller,
    this.title,
    this.hint,
    this.error,
    this.enabled = true,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput>
    with LoggableState, CustomLogger {
  bool _isFocused = false;
  late final FocusNode _focusNode = FocusNode()
    ..addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
  late bool _isObscured = widget.type == .password;

  InputBorder? get _border => OutlineInputBorder(
    borderRadius: .circular(12.r),
    borderSide: BorderSide(
      color: widget.error != null
          ? context.palette.error
          : _isFocused
          ? context.palette.primary
          : context.palette.grey,
      width: 1.r,
    ),
  );

  @override
  Widget build(BuildContext context) {
    logBuild();
    logDebug(
      operation: 'build()',
      message: 'инпут типа ${widget.type} собрана',
    );
    return Column(
      spacing: 4.5.h,
      crossAxisAlignment: .start,
      children: [
        if (widget.title != null)
          Text(
            widget.title!,
            style: context.styles.fieldLabelSemiBold14.copyWith(
              fontSize: 16.sp,
              color: widget.error != null
                  ? context.palette.error
                  : _isFocused
                  ? context.palette.primary
                  : context.palette.secondary,
            ),
          ),
        Stack(
          alignment: .topRight,
          children: [
            TextField(
              obscureText: _isObscured,
              obscuringCharacter: '•',
              focusNode: _focusNode,
              controller: widget.controller,
              enabled: widget.enabled,
              style: context.styles.bodyMediumRegular16,
              decoration: InputDecoration(
                hintStyle: context.styles.bodyMediumRegular16.copyWith(
                  color: widget.enabled
                      ? context.palette.hint
                      : context.palette.secondary,
                ),
                hintText: widget.hint,
                border: _border,
                enabledBorder: _border,
                focusedBorder: _border,
                disabledBorder: _border,
                fillColor: context.palette.darkenWhite,
                filled: true,
                isDense: true,
                contentPadding: .symmetric(
                  vertical: widget.type == .password ? 13.h : 12.h,
                  horizontal: 16.w,
                ),
              ),
            ),
            if (widget.type == .password)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                  logDebug(
                    operation: 'onChanged()',
                    message:
                        'Нажат глазик, значение скрытия текста $_isObscured',
                  );
                },
                child: Padding(
                  padding: .symmetric(vertical: 17.5.h, horizontal: 18.w),
                  child: SvgPicture.asset(
                    'assets/icons/eye.svg',
                    width: 24.w,
                    package: 'ui_kit',
                    height: 15.h,
                    colorFilter: .mode(context.palette.secondary, .srcIn),
                  ),
                ),
              ),
          ],
        ),
        if (widget.error != null)
          Text(
            widget.error!,
            style: context.styles.fieldLabelSemiBold14.copyWith(
              color: context.palette.error,
            ),
          ),
      ],
    );
  }
}
