/// Назначение: обработчик ошибок Domain в читаемы вид
/// Дата создания: 25.05.2026
/// Создал: Захар
sealed class DomainExceptions implements Exception {
  final String message;
  final String operation;
  final Object? cause;

  DomainExceptions({
    required this.message,
    required this.operation,
    required this.cause,
  });

  @override
  String toString() {
    final buffer = StringBuffer(
      'DomainException: (operation:$operation, message: $message',
    );
    if (cause != null) {
      buffer.write('cause: $cause');
    }
    buffer.write(')');
    return buffer.toString();
  }
}

/// Назначение: бработчик ошибок AUTH в читаемы вид
/// Дата создания: 25.05.2026
/// Создал: Захар
class AuthDomainException extends DomainExceptions {
  AuthDomainException({
    required super.message,
    required super.operation,
    required super.cause,
  });
}
