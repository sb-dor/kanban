import 'package:flutter/foundation.dart';
import 'package:sizzle_starter/src/feature/authentication/models/user.dart';

@immutable
class AuthenticationStateModel {
  const AuthenticationStateModel({this.user});

  final User? user;

  AuthenticationStateModel copyWith({User? user}) {
    return AuthenticationStateModel(user: (user ?? this.user)?.copyWith());
  }

  @override
  String toString() => 'AuthenticationStateModel(user: $user)';

  @override
  bool operator ==(covariant AuthenticationStateModel other) {
    if (identical(this, other)) return true;

    return other.user == user;
  }

  @override
  int get hashCode => user.hashCode;
}
