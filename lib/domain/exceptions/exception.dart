/// Назначение: обработчик ошибок Domain
/// Дата создания: 27.05.2026
/// Создал: Захар
sealed class DomainExceptions implements Exception {
  final String operation;
  final String message;
  final Object? cause;

  DomainExceptions({
    required this.operation,
    required this.message,
    required this.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer(
      'NetLibException: (operation: $operation, message: $message',
    );
    if (cause != null) {
      buffer.write(', cause: $cause');
    }
    return buffer.toString();
  }
}

/// Назначение: Обработчик ошибок Auth Domain
/// Дата создания: 27.05.2026
/// Создал: Захар
class AuthDomainExceptions extends DomainExceptions {
  AuthDomainExceptions({
    required super.operation,
    required super.message,
    required super.cause,
  });
}
