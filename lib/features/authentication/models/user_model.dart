import 'package:geniego/utils/constants/image_strings.dart';

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phone;
  final String role;
  final String image;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phone,
    required this.role,
    required this.image,
  });

  factory User.fromJson(jsonData) => User(
        id: jsonData['id'],
        firstName: jsonData['first_name'],
        lastName: jsonData['last_name'],
        username: jsonData['username'],
        email: jsonData['email'],
        phone: jsonData['phone'],
        role: jsonData['role'] ?? 'Customer',
        image: jsonData['icon'] ?? AppImages.user,
      );

  toJson() => {
        'id': id,
        'first_name': firstName,
        'last_name': lastName,
        'username': username,
        'email': email,
        'phone': phone,
        'role': role,
        'image': image,
      };

  String get fullName => '$firstName $lastName';

  @override
  String toString() =>
      'User(id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, phone: $phone, role: $role)';
}
