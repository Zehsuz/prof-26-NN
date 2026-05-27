import 'package:application/domain/services/llama_chat_service.dart';
/// Назначение: сценарий обращения к модельке
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlamaChatUseCase {
  final LlamaChatService _llamaChatService;

  LlamaChatUseCase({required LlamaChatService llamaChatService})
    : _llamaChatService = llamaChatService;
  /// получение истории сообщений
  String get history {
    final buffer = StringBuffer();
    for (var message in _llamaChatService.history) {
      buffer.writeln('${message.roleEnum?.name}\n${message.content}\n');
    }
    return buffer.toString();
  }
}
