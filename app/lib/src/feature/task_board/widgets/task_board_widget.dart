import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/common/layout/window_size.dart';
import 'package:sizzle_starter/src/feature/task_board/widgets/desktop/task_board_desktop_widget.dart';
import 'package:sizzle_starter/src/feature/task_board/widgets/mobile/task_board_mobile_widget.dart';

class TaskBoardWidget extends StatefulWidget {
  const TaskBoardWidget({super.key});

  @override
  State<TaskBoardWidget> createState() => _TaskBoardWidgetState();
}

class _TaskBoardWidgetState extends State<TaskBoardWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WindowSizeScope.of(context).maybeMap<Widget>(
        orElse: () => const TaskBoardDesktopWidget(), // any desktop ui
        compact: () => const TaskBoardMobileWidget(), // mobile ui
      ),
    );
  }
}
