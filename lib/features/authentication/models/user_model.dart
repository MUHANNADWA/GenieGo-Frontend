import 'dart:ui';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
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
    required this.phone,
    // required this.roleId,
  });

  factory User.fromJson(jsonData) => User(
        id: jsonData['id'],
        firstName: jsonData['first_name'],
        lastName: jsonData['last_name'],
        username: jsonData['username'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        // roleId: jsonData['role_id'],
      );

  toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'phone': phone,
        // 'roleId': roleId,
      };

  properties() =>
      ['First Name', 'Last Name', 'Username', 'Email', 'Phone', 'Role Id'];

  values() => [
        firstName,
        lastName,
        username,
        email,
        phone,
        /*roleId*/
      ];

  String get fullName => '$firstName $lastName';

  @override
  String toString() =>
      'User(id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, phone: $phone)';
  // , roleId: $roleId
}
