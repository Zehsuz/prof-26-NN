import 'package:application/data/data_sources/api_data_source.dart';
import 'package:application/data/repositories/auth_repository_impl.dart';
import 'package:application/domain/repositories/auth_repository.dart';
import 'package:application/domain/services/llama_chat_service.dart';
import 'package:application/domain/use_cases/llama_chat_use_case.dart';
import 'package:application/domain/use_cases/login_use_case.dart';
import 'package:application/presentation/notifiers/llm_notifier.dart';
import 'package:application/presentation/notifiers/login_notifier.dart';
import 'package:application/presentation/widgets/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logging/logging.dart';
import 'package:net_service/net_service.dart';
import 'package:provider/provider.dart';

void main() {
  Logger.root.level = .ALL;
  Logger.root.onRecord.listen((log) => print(log.message));
  final AuthInterceptor interceptor = AuthInterceptor();
  final NetHttpClient client = NetHttpClient(
    Dio()..interceptors.addAll([interceptor, LoggingInterceptor()]),
    baseUrl: 'http://10.0.2.2:8090/api/collections',
  );
  final ApiDataSource apiDataSource = ApiDataSource(
    interceptor: interceptor,
    client: client,
  );
  final AuthRepository authRepository = AuthRepositoryImpl(
    apiDataSource: apiDataSource,
  );
  runApp(
    MultiProvider(
      providers: [
        Provider(
          create: (context) => LoginUseCase(authRepository: authRepository),
        ),
        Provider(create: (context) => LlamaChatService()),
        Provider(
          create: (context) =>
              LlamaChatUseCase(llamaChatService: context.read()),
        ),
        ChangeNotifierProvider<LlmNotifier>(
          create: (context) => LlmNotifier(
            llmUseCase: context.read(),
            llamaChatService: context.read(),
          ),
        ),
        ChangeNotifierProvider<LoginNotifier>(
          create: (context) => LoginNotifier(loginUseCase: context.read()),
        ),
      ],
      child: App(),
    ),
  );
}
