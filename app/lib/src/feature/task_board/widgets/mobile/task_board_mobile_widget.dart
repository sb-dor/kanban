import 'package:flutter/material.dart';

class TaskBoardMobileWidget extends StatefulWidget {
  const TaskBoardMobileWidget({super.key});

  @override
  State<TaskBoardMobileWidget> createState() => _TaskBoardMobileWidgetState();
}

class _TaskBoardMobileWidgetState extends State<TaskBoardMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Mobile"));
  }
}
