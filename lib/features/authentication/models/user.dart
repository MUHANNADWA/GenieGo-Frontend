class User {
  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String password;
  final String phone;
  final int roleId;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.password,
    required this.phone,
    required this.roleId,
  });

  factory User.fromJson(jsonData) {
    return User(
      id: jsonData['id'],
      firstName: jsonData['first_name'],
      lastName: jsonData['last_name'],
      username: jsonData['username'],
      email: jsonData['email'],
      password: jsonData['password'],
      phone: jsonData['phone'],
      roleId: jsonData['role_id'],
    );
  }

  toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'password': password,
      'phone': phone,
      'roleId': roleId,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, firstName: $firstName, lastName: $lastName, username: $username, email: $email, password: $password, phone: $phone, roleId: $roleId)';
  }
}
