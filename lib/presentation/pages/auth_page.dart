import 'package:application/presentation/pages/signup_page.dart';
import 'package:application/presentation/pages/vacancies_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit.dart';

import '../notifiers/auth_notifier.dart';

/// Назначение: экран авторизации
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with LoggableState, CustomLogger {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<AuthNotifier>();
    return Scaffold(
      backgroundColor: context.palette.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 20.w, vertical: 163.5.h),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, state, _) {
                if (state case AuthPageLoaded(:final userEntity)) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Успешный вход'),
                        content: Column(
                          mainAxisSize: .min,
                          children: [
                            Text(userEntity.name),
                            Text(userEntity.firstName),
                            Text(userEntity.lastName ?? ''),
                            Text(userEntity.created.toString()),
                          ],
                        ),
                      ),
                    );
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => VacanciesMainPage(),
                      ),
                    );
                  });
                }
                if (state case AuthPageFailure(:final message)) {
                  WidgetsBinding.instance.addPostFrameCallback(
                    (_) => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('ХАХА ОШИБКА'),
                        content: Text(message),
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    Padding(
                      padding: .only(bottom: 32.h),
                      child: Column(
                        children: [
                          Padding(
                            padding: .only(bottom: 16.r),
                            child: Container(
                              decoration: BoxDecoration(
                                color: context.palette.white,
                                borderRadius: .circular(12.r),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 12.r,
                                    offset: .new(0, 4),
                                    color: Colors.black.withValues(alpha: 0.05),
                                  ),
                                ],
                              ),
                              width: 60.5.w,
                              height: 59.h,
                              padding: .all(16.r),
                              child: SvgPicture.asset(
                                'assets/icons/logo.svg',
                                width: 28.5.r,
                                height: 27.r,
                                colorFilter: .mode(
                                  context.palette.primary,
                                  .srcIn,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: .only(bottom: 4.h),
                            child: Text(
                              'HR Connect',
                              style: context.styles.screenHeaderBold24,
                            ),
                          ),
                          Text(
                            'Talent Management Portal',
                            style: context.styles.bodySmallRegular14.copyWith(
                              color: context.palette.subText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: .infinity,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 12.r,
                            offset: .new(0, 4),
                            color: Colors.black.withValues(alpha: 0.05),
                          ),
                        ],
                        color: context.palette.white,
                        borderRadius: .circular(12.r),
                        border: .all(
                          color: context.palette.background,
                          width: 1.r,
                        ),
                      ),
                      padding: .all(24.r),
                      child: Column(
                        crossAxisAlignment: .stretch,
                        spacing: 24.h,
                        children: [
                          CustomInput(
                            enabled: true,
                            type: .base,
                            controller: _emailController,
                            hint: 'username or email',
                            title: 'Login',
                          ),
                          CustomInput(
                            enabled: true,
                            type: .password,
                            controller: _passwordController,
                            hint: '••••••••',
                            title: 'Password',
                          ),
                          Padding(
                            padding: .only(left: 4.w),
                            child: Row(
                              spacing: 8.w,
                              children: [
                                Container(
                                  width: 20.r,
                                  height: 20.r,
                                  color: context.palette.background,
                                ),
                                Text(
                                  textAlign: .start,
                                  'Remember Me',
                                  style: context.styles.bodySmallRegular14
                                      .copyWith(color: context.palette.subText),
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            type: .primary,
                            text: 'Login',
                            onPressed: () async {
                              logInfo(
                                operation: 'onPressed',
                                message: 'Нажата кнопка входа',
                              );
                              await _login();
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: .only(top: 24.h),
                      child: GestureDetector(
                        onTap: () {
                          logInfo(
                            operation: 'Navigation',
                            message: 'Переход на страницу SignUp',
                          );
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ),
                          );
                        },
                        child: Text(
                          'Go to RegisterPage',
                          style: context.styles.fieldLabelSemiBold14.copyWith(
                            color: context.palette.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    final notifier = context.read<AuthNotifier>();
    await notifier.login(
      identity: _emailController.text,
      password: _passwordController.text,
    );
    if (notifier.value is AuthPageLoaded) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => VacanciesMainPage()),
      );
    }
  }
}
