import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger_helper/logger_helper.dart';
import 'package:provider/provider.dart';
import 'package:ui_kit/ui_kit_26_05_26.dart';

import '../notifiers/llm_notifier.dart';

/// Назначение: экран llm
/// Дата создания: 27.05.2026
/// Создал: Захар
class LlmPage extends StatefulWidget {
  const LlmPage({super.key});

  @override
  State<LlmPage> createState() => _LlmPageState();
}

class _LlmPageState extends State<LlmPage> with LoggableState, CustomLogger {
  final _message = TextEditingController();

  @override
  void initState() {
    super.initState();
    final notifier = context.read<LlmNotifier>();
    notifier.init();
  }

  @override
  Widget build(BuildContext context) {
    final notifier = context.watch<LlmNotifier>();
    logBuild();
    return Scaffold(
      backgroundColor: context.palette.darkenWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: .symmetric(horizontal: 20.w, vertical: 162.5.h),
          child: ValueListenableBuilder(
            valueListenable: notifier,
            builder: (context, state, _) => Column(
              children: [
                Column(
                  children: [
                    if (state case LlmPageLoaded(:final message)) Text(message),
                    if (state case LlmPageFailure(:final message))
                      Text(message),
                  ],
                ),
                CustomInput(controller: _message),
                if (state case LlmPageLoading())
                  CircularProgressIndicator(color: Colors.red),
                CustomButton(
                  onPressed: () async {
                    logInfo(
                      operation: 'onPressed',
                      message: 'Нажата кнопка отправки сообщения llm агенту',
                    );
                    await _reply();
                  },
                  text: 'send',
                  type: .primary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _reply() async {
    final notifier = context.read<LlmNotifier>();
    final text = _message.text;
    _message.clear();
    await notifier.reply(text);
    setState(() {});
  }
}
