import 'package:flutter_test/flutter_test.dart';
import 'package:logger/logger.dart';
import 'package:rest_client/rest_client.dart';
import 'package:sizzle_starter/src/core/constant/application_config.dart';
import 'package:sizzle_starter/src/feature/authentication/bloc/authentication_bloc.dart';
import 'package:sizzle_starter/src/feature/authentication/data/authentication_repository.dart';
import 'package:sizzle_starter/src/feature/authentication/data/datasource/authentication_remote_datasource.dart';
import 'package:sizzle_starter/src/feature/authentication/widgets/authentication_widget.dart';
import 'package:sizzle_starter/src/feature/initialization/model/dependencies_container.dart';
import 'package:sizzle_starter/src/feature/settings/bloc/app_settings_bloc.dart';
import 'package:sizzle_starter/src/feature/initialization/logic/composition_root.dart' as cr;
import 'package:http/http.dart' as http;

import '../../../../helpers/test_widget_controller.dart';

void main() {
  group('HomeScreen', () {
    testWidgets('renders correctly', (widgetTester) async {
      final controller = TestWidgetController(widgetTester);

      await controller.pumpWidget(
        const AuthenticationWidget(),
        dependencies: TestDependenciesContainer(),
      );

      expect(find.text('Authentication Widget'), findsOneWidget);
    });
  });
}

/// {@template home_screen_dependencies_container}
/// Example of how to create a dependencies container for testing purposes.
///
/// If the dependency is dynamic, like mocks, you can pass them as parameters
/// to the constructor.
/// {@endtemplate}
base class HomeScreenDependenciesContainer extends TestDependenciesContainer {
  /// {@macro home_screen_dependencies_container}
  const HomeScreenDependenciesContainer();

  @override
  Logger get logger => Logger();

  @override
  AuthenticationBloc get authenticationBloc => AuthenticationBloc(
    authenticationRepository: AuthenticationRepository(
      authenticationRemoteDataSource: AuthenticationRemoteDataSource(
        logger: Logger(),
        restClientBase: restClientBase,
      ),
    ),
  );
}
