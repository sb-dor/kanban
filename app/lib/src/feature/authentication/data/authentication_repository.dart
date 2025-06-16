import 'package:sizzle_starter/src/feature/authentication/data/datasource/authentication_datasource.dart';
import 'package:sizzle_starter/src/feature/authentication/models/user.dart';

abstract interface class IAuthenticationRepository {
  Future<User?> signIn({required String email, required String password});

  Future<bool> signOut();

  Future<User?> getCurrentUser();
}

// example of using local and remote data sources
final class AuthenticationRepository implements IAuthenticationRepository {
  AuthenticationRepository({
    required this.authenticationRemoteDataSource,
    // required this.authenticationLocalDataSource,
    // required this.internetConnection,
  });

  final IAuthenticationDataSource authenticationRemoteDataSource;
  // final IAuthenticationDataSource authenticationLocalDataSource;

  // final InternetConnection internetConnection;

  @override
  Future<User?> getCurrentUser() async {
    // final hasInternet = await internetConnection.hasInternetAccess;
    // if (hasInternet) {
    return authenticationRemoteDataSource.getCurrentUser();
    // } else {
    //   return authenticationLocalDataSource.getCurrentUser();
    // }
  }

  @override
  Future<User?> signIn({required String email, required String password}) async {
    // final hasInternet = await internetConnection.hasInternetAccess;
    // if (hasInternet) {
    return authenticationRemoteDataSource.signIn(email: email, password: password);
    // } else {
    //   return authenticationLocalDataSource.signIn(email: email, password: password);
    // }
  }

  @override
  Future<bool> signOut() async {
    // final hasInternet = await internetConnection.hasInternetAccess;
    // if (hasInternet) {
    return authenticationRemoteDataSource.signOut();
    // } else {
    //   return authenticationLocalDataSource.signOut();
    // }
  }
}
