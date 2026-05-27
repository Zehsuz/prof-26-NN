import 'package:flutter/material.dart';
import 'package:ui_kit/src/presentation/theme/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  final Palette palette;

  Styles({required this.palette});

  String get _package => 'ui_kit';

  String get _family => 'Manrope';

  TextStyle get screenHeaderBold24 => TextStyle(
    package: _package,
    fontFamily: _family,
    fontSize: 24.sp,
    height: 32/24,
    fontWeight: .w700,
    letterSpacing: -0.48.sp,
    color: palette.black,
  );
  TextStyle get subheaderSemiBold18 => TextStyle(
    package: _package,
    fontFamily: _family,
    fontSize: 18.sp,
    height: 24/18,
    fontWeight: .w600,
    letterSpacing: -0.18.sp,
    color: palette.black,
  );
  TextStyle get bodyMediumRegular16 => TextStyle(
    package: _package,
    fontFamily: _family,
    fontSize: 16.sp,
    height: 24/16,
    fontWeight: .w400,
    letterSpacing: 0.sp,
    color: palette.black,
  );
  TextStyle get bodySmallRegular14 => TextStyle(
    package: _package,
    fontFamily: _family,
    fontSize: 14.sp,
    height: 20/14,
    fontWeight: .w400,
    letterSpacing: 0.sp,
    color: palette.black,
  );
  TextStyle get fieldLabelSemiBold14 => TextStyle(
    package: _package,
    fontFamily: _family,
    fontSize: 14.sp,
    height: 20/14,
    fontWeight: .w600,
    letterSpacing: 0.sp,
    color: palette.black,
  );
}
