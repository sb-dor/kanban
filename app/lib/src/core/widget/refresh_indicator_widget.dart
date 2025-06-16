import 'package:flutter/material.dart';

class RefreshIndicatorWidget extends StatelessWidget {
  //
  const RefreshIndicatorWidget({
    super.key,
    required this.onRefresh,
    required this.child,
    this.backgroundColor,
    this.color,
  });

  final Future<void> Function() onRefresh;
  final Widget child;

  final Color? backgroundColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      backgroundColor: backgroundColor,
      color: color,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
