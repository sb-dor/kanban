import 'package:logger/logger.dart';
import 'package:rest_client/rest_client.dart';
import 'package:sizzle_starter/src/feature/authentication/data/datasource/authentication_datasource.dart';
import 'package:sizzle_starter/src/feature/authentication/models/user.dart';

// datasources can have try-catch only that time when it's necessary
// otherwise it will be propagated to bloc -> blocObserver -> runZoneGuarded (if blocObserver does not propagate it further)

// more info about Error handling:
// https://lazebny.io/mastering-error-handling/
final class AuthenticationRemoteDataSource implements IAuthenticationDataSource {
  AuthenticationRemoteDataSource({required this.logger, required this.restClientBase});

  final Logger logger;

  // use for network requests
  final RestClientBase restClientBase;

  @override
  Future<User?> getCurrentUser() async {
    // Simulate a network call or database query
    await Future.delayed(const Duration(seconds: 1));
    return const User(id: '123', email: 'test@example.com');
  }

  @override
  Future<User?> signIn({required String email, required String password}) async {
    // Simulate a network call or database query
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'test@example.com' && password == 'password') {
      return const User(id: '123', email: 'test@example.com');
    }
    return null;
  }

  @override
  Future<bool> signOut() async {
    // Simulate a network call or database query
    await Future.delayed(const Duration(seconds: 1));
    return true; // Simulate successful sign-out
  }
}
