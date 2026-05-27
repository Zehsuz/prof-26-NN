import 'dart:io';

import 'package:flutter/services.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:path_provider/path_provider.dart';
import 'package:llamadart/llamadart.dart';

/// Назначение: сервис общения с LLM моделью
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlamaChatService with CustomLogger {
  final _engine = LlamaEngine(LlamaBackend());
  ChatSession? _chatSession;
  static const _contextSize = 2048;

  bool get _isInitialized => _engine.isReady && _chatSession != null;

  List<LlamaChatMessage> get history => _chatSession?.history ?? [];

  /// инициализация сервиса обращения к модели
  Future<void> initialize() async {
    if (_isInitialized) return;

    final docDirectory = await getApplicationDocumentsDirectory();
    final localModelFile = File('${docDirectory.path}/model.gguf');

    if (!localModelFile.existsSync()) {
      final assetData = await rootBundle.load(
        'assets/models/gemma-3-270m-it-qat-Q4_0.gguf',
      );
      localModelFile.writeAsBytesSync(
        assetData.buffer.asUint8List(
          assetData.offsetInBytes,
          assetData.lengthInBytes,
        ),
      );
    }

    await _engine.loadModel(
      localModelFile.path,
      modelParams: ModelParams(contextSize: _contextSize),
    );

    _chatSession = ChatSession(_engine);
  }

  /// отправка сообщения llm, [text] - сообщение
  Future<void> reply(String text) async {
    if (!_isInitialized) throw StateError('сервис не инициализирован');
    await for (final message in _chatSession!.create([
      LlamaTextContent(text),
    ])) {
      logDebug(
        operation: 'generated response llm',
        message: message.toString(),
      );
    }
  }
}
