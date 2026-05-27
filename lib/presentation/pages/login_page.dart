import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';
/// Назначение: экран авторизации
/// Дата создания: 27.05.2026
/// Создал: Захар
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with LoggableState, CustomLogger {
  @override
  Widget build(BuildContext context) {
    logBuild();
    return Scaffold(
      backgroundColor: context.palette.darkenWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 20.w, vertical: 162.5.h),
          child: Column(
            children: [
              Column(
                spacing: 16.h,
                children: [
                  Container(
                    padding: .all(16.r),
                    width: 60.5.w,
                    height: 59.h,
                    decoration: BoxDecoration(
                      borderRadius: .circular(12.r),
                      color: context.palette.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 2.r,
                          offset: .new(0, 1.h),
                        ),
                      ],
                    ),
                    child: Center(
                      child: SvgPicture.asset(
                        'assets/icons/logo.svg',
                        width: 28.5.w,
                        height: 27.h,
                        colorFilter: .mode(context.palette.primary, .srcIn),
                      ),
                    ),
                  ),
                  Padding(
                    padding: .only(bottom: 32.h),
                    child: Column(
                      spacing: 4.h,
                      children: [
                        Text(
                          'HR Connect',
                          style: context.styles.screenHeaderBold24.copyWith(
                            color: context.palette.primary,
                          ),
                        ),
                        Text(
                          'Портал управления талантами',
                          style: context.styles.fieldLabelSemiBold14.copyWith(
                            color: context.palette.secondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ClipRRect(
                borderRadius: .circular(12.r),
                child: Stack(
                  children: [
                    Container(
                      padding: .all(24.r),
                      width: .infinity,
                      decoration: BoxDecoration(
                        color: context.palette.white,
                        borderRadius: .circular(12.r),
                        border: .all(
                          color: context.palette.secondary,
                          width: 1.r,
                        ),
                      ),
                      height: 352.h,
                      child: Column(
                        spacing: 24.h,
                        children: [
                          CustomInput(
                            controller: .new(),
                            title: 'Логин',
                            hint: 'Email',
                          ),
                          CustomInput(
                            controller: .new(),
                            type: .password,
                            hint: '••••••••',
                            title: 'Пароль',
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: .infinity,
                      height: 352.h,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.05),
                            offset: .new(0, -16.h),
                            blurRadius: 12.2.r,
                            spreadRadius: 0.r,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: .only(top: 24.h),
                child: Text(
                  'Зарегистрироваться?',
                  style: context.styles.subheaderSemiBold18.copyWith(
                    color: context.palette.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
