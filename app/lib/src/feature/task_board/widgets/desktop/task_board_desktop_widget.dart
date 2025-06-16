import 'package:flutter/material.dart';

class TaskBoardDesktopWidget extends StatefulWidget {
  const TaskBoardDesktopWidget({super.key});

  @override
  State<TaskBoardDesktopWidget> createState() => _TaskBoardDesktopWidgetState();
}

class _TaskBoardDesktopWidgetState extends State<TaskBoardDesktopWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Desktop'));
  }
}
