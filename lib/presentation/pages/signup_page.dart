import 'package:application/presentation/pages/auth_page.dart';
import 'package:application/presentation/pages/vacancies_main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit.dart';

import '../notifiers/sign_up_notifier.dart';

/// Назначение: экран регистрации
/// Дата создания: 25.05.2026
/// Создал: Захар
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage>
    with LoggableState, CustomLogger {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _passwordConfirmController = TextEditingController();
  late String _active;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _getProfile());
  }

  Future<void> _getProfile() async {
    final notifier = context.read<SignUpNotifier>();
    _active = await notifier.getProfile(id: 'e6wpfxcdgh3m6o4');
    logDebug(operation: 'Active user', message: _active.toString());
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<SignUpNotifier>();
    return Scaffold(
      backgroundColor: context.palette.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 20.w, vertical: 86.h),
          child: Center(
            child: ValueListenableBuilder(
              valueListenable: notifier,
              builder: (context, state, _) {
                if (state case SignUpPageLoaded(:final userEntity)) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text('Успешная регистрация'),
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
                if (state case SignUpPageFailure(:final message)) {
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
                        spacing: 16.h,
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding: .only(bottom: 4.h),
                                child: Text(
                                  textAlign: .center,
                                  'HR Connect',
                                  style: context.styles.screenHeaderBold24,
                                ),
                              ),
                              Container(
                                width: 254.23.w,
                                child: Expanded(
                                  child: Text(
                                    overflow: .clip,
                                    textAlign: .center,
                                    'Modern Talent Engine for HR Excellence',
                                    style: context.styles.bodySmallRegular14
                                        .copyWith(
                                          color: context.palette.subText,
                                          overflow: .clip,
                                        ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            spacing: 16.w,
                            children: [
                              Expanded(
                                child: CustomInput(
                                  enabled: true,
                                  type: .base,
                                  controller: _firstNameController,
                                  hint: 'John',
                                  title: 'First Name',
                                ),
                              ),
                              Expanded(
                                child: CustomInput(
                                  enabled: true,
                                  type: .base,
                                  controller: _lastNameController,
                                  hint: 'Doe',
                                  title: 'Last Name',
                                ),
                              ),
                            ],
                          ),
                          Column(
                            spacing: 4.h,
                            crossAxisAlignment: .start,
                            children: [
                              CustomInput(
                                enabled: true,
                                type: .base,
                                controller: _emailController,
                                hint: 'name@domain.ru',
                                title: 'Email',
                              ),
                              Text(
                                'Lowercase letters and digits only (name@domain.ru)',
                                style: context.styles.subscribeRegular12
                                    .copyWith(color: context.palette.subText),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: .start,
                            spacing: 4.h,
                            children: [
                              CustomInput(
                                enabled: true,
                                type: .password,
                                controller: _passwordController,
                                hint: '••••••••',
                                title: 'Password',
                              ),

                              Text(
                                'Minimum 8 characters',
                                style: context.styles.subscribeRegular12
                                    .copyWith(color: context.palette.subText),
                              ),
                            ],
                          ),
                          CustomInput(
                            enabled: true,
                            type: .password,
                            controller: _passwordConfirmController,
                            hint: '••••••••',
                            title: 'Confirm Password',
                          ),
                          Padding(
                            padding: .only(left: 4.w, bottom: 16.h),
                            child: Row(
                              crossAxisAlignment: .start,
                              spacing: 8.w,
                              children: [
                                Container(
                                  width: 20.r,
                                  height: 20.r,
                                  color: context.palette.background,
                                ),
                                Expanded(
                                  child: Text(
                                    textAlign: .start,
                                    overflow: .clip,
                                    'I agree to the terms of use and privacy policy.',
                                    style: context.styles.bodySmallRegular14
                                        .copyWith(
                                          color: context.palette.subText,
                                          overflow: .clip,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomButton(
                            type: .primary,
                            text: 'Register',
                            onPressed: () async {
                              logInfo(
                                operation: 'onPressed',
                                message: 'Нажата кнопка Register',
                              );
                              await _signup();
                            },
                          ),
                          Padding(
                            padding: .only(top: 24.h),
                            child: Row(
                              mainAxisAlignment: .center,
                              crossAxisAlignment: .center,
                              children: [
                                Text(
                                  textAlign: .center,
                                  'Already have an account? ',
                                  style: context.styles.bodySmallRegular14
                                      .copyWith(color: context.palette.subText),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    logInfo(
                                      operation: 'Navigation',
                                      message: 'Переход на страницу SignIn',
                                    );
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => AuthPage(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    textAlign: .center,
                                    'Sign in',
                                    style: context.styles.fieldLabelSemiBold14
                                        .copyWith(
                                          color: context.palette.primary,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

  Future<void> _signup() async {
    final notifier = context.read<SignUpNotifier>();
    await notifier.signup(
      email: _emailController.text,
      password: _passwordController.text,
      passwordConfirm: _passwordConfirmController.text,
      name: _emailController.text.split('@')[0],
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      middleName: '_middleNameController.text',
      phone: '+11231231231',
      role: 'HR',
      isActive: true,
    );
  }
}
