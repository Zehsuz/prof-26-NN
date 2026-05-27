/// Назначение: обработчик ошибки NetLib
/// Дата создания: 26.05.2026
/// Создал: Захар
class NetLibException implements Exception {
  final String operation;
  final String message;
  final Object? cause;

  NetLibException(
      {required this.operation, required this.message, required this.cause});

  @override
  String toString() {
    final buffer = StringBuffer(
        'NetLibException: (operation: $operation, message: $message');
    if (cause != null) {
      buffer.write(', cause: $cause');
    }
    return buffer.toString();
  }
}