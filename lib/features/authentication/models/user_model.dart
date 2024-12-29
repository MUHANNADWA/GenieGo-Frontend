import 'dart:io';
import 'dart:ui';

import 'package:image_picker/image_picker.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  // final String password;
  final String phone;
  Image? image;
  // final int roleId;

  User({
    this.image,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    // required this.password,
    required this.phone,
    // required this.roleId,
  });

  factory User.fromJson(jsonData) {
    return User(
      id: jsonData['id'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      username: jsonData['username'],
      email: jsonData['email'],
      // password: jsonData['password'],
      phone: jsonData['phone'],
      // roleId: jsonData['role_id'],
    );
  }

  toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'username': username,
      'email': email,
      // 'password': password,
      'phone': phone,
      // 'roleId': roleId,
    };
  }

  properties() {
    ['First Name', 'Last Name', 'Username', 'Email', 'Phone', 'Role Id'];
  }

  values() {
    [
      firstName,
      lastName,
      username,
      email,
      phone, /*roleId*/
    ];
  }

  String get fullName => '$firstName $lastName';

  @override
  String toString() {
    // password: $password
    // , roleId: $roleId
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, phone: $phone)';
  }
}
