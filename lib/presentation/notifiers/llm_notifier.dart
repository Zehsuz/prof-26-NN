import 'package:application/domain/services/llama_chat_service.dart';
import 'package:application/domain/use_cases/llama_chat_use_case.dart';
import 'package:flutter/material.dart';

/// Назначение: определяет состояния LlmPage
/// Дата создания: 27.05.2026
/// Создал: Захар
sealed class LlmPageState {
  const LlmPageState();
}

/// Назначение: определяет состояния LlmPageIdle
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlmPageIdle extends LlmPageState {
  const LlmPageIdle();
}

/// Назначение: определяет состояния LlmPageFailure
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlmPageFailure extends LlmPageState {
  final String message;

  const LlmPageFailure({required this.message});
}

/// Назначение: определяет состояния LlmPageLoading
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlmPageLoading extends LlmPageState {
  const LlmPageLoading();
}

/// Назначение: определяет состояния LlmPageLoaded
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlmPageLoaded extends LlmPageState {
  final String message;

  const LlmPageLoaded({required this.message});
}

/// Назначение: методы экрана Llm
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlmNotifier extends ValueNotifier<LlmPageState> {
  final LlamaChatUseCase _llmChatUseCase;
  final LlamaChatService _llamaChatService;

  LlmNotifier({
    required LlamaChatUseCase llmUseCase,
    required LlamaChatService llamaChatService,
  }) : _llamaChatService = llamaChatService,
       _llmChatUseCase = llmUseCase,
       super(const LlmPageIdle());

  /// получение истории модельки
  Future<void> getHistory() async {
    try {
      value = LlmPageLoading();
      final message = _llmChatUseCase.history;
      value = LlmPageLoaded(message: message);
    } catch (e) {
      value = LlmPageFailure(message: e.toString());
    }
  }

  /// отправки сообщения агенту, [text] - сообщение
  Future<void> reply(String text) async {
    try {
      value = LlmPageLoading();
      await _llamaChatService.reply(text);
      value = LlmPageLoaded(message: _llmChatUseCase.history);
    } catch (e) {
      value = LlmPageFailure(message: e.toString());
    }
  }
  /// функция иницилизации
  Future<void> init() async {
    value = LlmPageLoading();
    await _llamaChatService.initialize();
    getHistory();
  }
}
