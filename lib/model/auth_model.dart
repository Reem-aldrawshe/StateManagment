class AuthModel {
  final String email;
  final String username;
  final String role;
  final String password;

  AuthModel({
    required this.email,
    required this.username,
    required this.role,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'role': role,
      'password': password,
    };
  }

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      username: json['username'],
      role: json['role'],
      password: json['password'],
    );
  }
}
