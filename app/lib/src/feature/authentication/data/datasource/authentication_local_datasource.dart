// import 'package:logger/logger.dart';
// import 'package:sizzle_starter/src/feature/authentication/data/datasource/authentication_datasource.dart';
// import 'package:sizzle_starter/src/feature/authentication/models/user.dart';

// // datasources can have try-catch only that time when it's necessary
// // otherwise it will be propagated to bloc -> blocObserver -> runZoneGuarded (if blocObserver does not propagate it further)

// // more info about Error handling:
// // https://lazebny.io/mastering-error-handling/
// final class AuthenticationLocalDatasource implements IAuthenticationDataSource {
//   AuthenticationLocalDatasource({required this.logger, required this.usersDatabaseHelper});

//   final Logger logger;
//   final UsersDatabaseHelper usersDatabaseHelper;

//   @override
//   Future<User?> getCurrentUser() => usersDatabaseHelper.getCurrentUser();

//   @override
//   Future<User?> signIn({required String email, required String password}) =>
//       usersDatabaseHelper.signIn(email: email, password: password);

//   @override
//   Future<bool> signOut() => usersDatabaseHelper.signOut();
// }
