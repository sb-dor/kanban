import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({required this.id, required this.email, this.name});

  final String id;
  final String email;
  final String? name;

  User copyWith({String? id, String? email, String? name}) {
    return User(id: id ?? this.id, email: email ?? this.email, name: name ?? this.name);
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'id': id, 'email': email, 'name': name};
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      name: map['name'] as String?,
    );
  }

  // factory User.fromUserTable(UsersTableData userTableData) {
  //   return User(
  //     id: userTableData.id.toString(),
  //     email: userTableData.email,
  //     name: userTableData.name,
  //   );
  // }

  @override
  String toString() => 'User(id: $id, email: $email, name: $name)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.id == id && other.email == email && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ email.hashCode ^ name.hashCode;
}
