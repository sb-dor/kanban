import 'package:flutter/material.dart';
import 'package:sizzle_starter/src/core/constant/localization/localization.dart';
import 'package:sizzle_starter/src/feature/authentication/widgets/authentication_widget.dart';
import 'package:sizzle_starter/src/feature/settings/model/app_theme.dart';
import 'package:sizzle_starter/src/feature/settings/widget/settings_scope.dart';
import 'package:sizzle_starter/src/feature/task_board/widgets/task_board_widget.dart';

/// {@template material_context}
/// [MaterialContext] is an entry point to the material context.
///
/// This widget sets locales, themes and routing.
/// {@endtemplate}
class MaterialContext extends StatelessWidget {
  /// {@macro material_context}
  const MaterialContext({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey(debugLabel: 'MaterialContext');

  @override
  Widget build(BuildContext context) {
    final settings = SettingsScope.settingsOf(context);
    final mediaQueryData = MediaQuery.of(context);

    final theme = settings.appTheme ?? AppTheme.defaultTheme;
    final lightTheme = theme.buildThemeData(Brightness.light);
    final darkTheme = theme.buildThemeData(Brightness.dark);

    final themeMode = theme.themeMode;

    return MaterialApp(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      locale: settings.locale,
      localizationsDelegates: Localization.localizationDelegates,
      supportedLocales: Localization.supportedLocales,
      home: const AuthenticationWidget(),
      initialRoute: '/authentication',
      routes: {
        '/authentication': (context) => const AuthenticationWidget(),
        'task-board': (context) => const TaskBoardWidget(),
      },
      builder:
          (context, child) => MediaQuery(
            key: _globalKey,
            data: mediaQueryData.copyWith(
              textScaler: TextScaler.linear(
                mediaQueryData.textScaler.scale(settings.textScale ?? 1).clamp(0.5, 2),
              ),
            ),
            child: child!,
          ),
    );
  }
}
