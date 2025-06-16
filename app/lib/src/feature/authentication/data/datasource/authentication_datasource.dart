import 'package:sizzle_starter/src/feature/authentication/models/user.dart';

abstract interface class IAuthenticationDataSource {
  Future<User?> signIn({required String email, required String password});

  Future<bool> signOut();

  Future<User?> getCurrentUser();
}
