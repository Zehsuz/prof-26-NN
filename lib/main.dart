import 'package:application/data/data_sources/api_data_source.dart';
import 'package:application/data/repositories/auth_repository_impl.dart';
import 'package:application/domain/repositories/auth_repository.dart';
import 'package:application/domain/repositories/user_repository.dart';
import 'package:application/domain/use_cases/auth_use_case.dart';
import 'package:application/domain/use_cases/get_profile_use_case.dart';
import 'package:application/domain/use_cases/signup_use_case.dart';
import 'package:application/presentation/notifiers/auth_notifier.dart';
import 'package:application/presentation/notifiers/sign_up_notifier.dart';
import 'package:application/presentation/notifiers/vacancies_main_page_notifier.dart';
import 'package:application/presentation/widgets/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:net_service/net_service.dart';
import 'package:provider/provider.dart';

import 'data/repositories/user_repository_impl.dart';

void main() {
  Logger.root.level = .ALL;
  Logger.root.onRecord.listen((log) => print(log.message));
  final AuthInterceptor interceptor = AuthInterceptor();
  final NetHttpClient client = NetHttpClient(
    Dio()..interceptors.addAll([interceptor, LoggingInterceptor()]),
    baseUrl: 'http://10.0.2.2:8090/api/collections',
  );
  final ApiDataSource apiDataSource = ApiDataSource(
    client: client,
    interceptor: interceptor,
  );
  final AuthRepository authRepository = AuthRepositoryImpl(
    apiDataSource: apiDataSource,
  );
  final UserRepository userRepository = UserRepositoryImpl(
    apiDataSource: apiDataSource,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider<AuthUseCase>(
          create: (context) => AuthUseCase(authRepository: authRepository),
        ),
        Provider<GetProfileUseCase>(
          create: (context) =>
              GetProfileUseCase(userRepository: userRepository),
        ),
        Provider<SignUpUseCase>(
          create: (context) => SignUpUseCase(authRepository: authRepository),
        ),
        ChangeNotifierProvider<AuthNotifier>(
          create: (context) => AuthNotifier(
            authUseCase: context.read<AuthUseCase>(),
            getProfileUseCase: context.read<GetProfileUseCase>(),
          ),
        ),
        ChangeNotifierProvider<SignUpNotifier>(
          create: (context) =>
              SignUpNotifier(signUpUseCase: context.read<SignUpUseCase>()),
        ),
        ChangeNotifierProvider<VacanciesMainPageNotifier>(
          create: (context) => VacanciesMainPageNotifier(
            signUpUseCase: context.read<SignUpUseCase>(),
          ),
        ),
      ],
      child: App(),
    ),
  );
}
