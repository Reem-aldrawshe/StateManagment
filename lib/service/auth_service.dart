import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio(BaseOptions(baseUrl: 'https://zamzaam.onrender.com'));

  Future<bool> login(String email, String password) async {
    try {
      final response = await _dio.post('/login', data: {
        'email': email,
        'password': password,
      });

      if (response.statusCode == 200) {
        final token = response.data['access_token'];
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        return true;
      }
    } catch (e) {
      print('Login error: $e');
    }
    return false;
  }

  Future<bool> register(String username, String email, String password) async {
    try {
      final response = await _dio.post('/users/', data: {
        'username': username,
        'email': email,
        'password': password,
        'role': 'user',
      });

      return response.statusCode == 201;
    } catch (e) {
      print('Register error: $e');
      return false;
    }
  }
}

// import 'package:dio/dio.dart';
// import '../model/auth_model.dart';

// class AuthService {
//   final Dio _dio = Dio();
//   final String baseUrl = 'https://zamzaam.onrender.com/users/';

//   Future<void> register(AuthModel model) async {
//     try {
//       final response = await _dio.post(baseUrl, data: model.toJson());
//       if (response.statusCode == 201 || response.statusCode == 200) {
//         print("Registration successful: ${response.data}");
//       } else {
//         throw Exception('Registration failed with status: ${response.statusCode}');
//       }
//     } catch (e) {
//       print("Registration error: $e");
//       rethrow;
//     }
//   }
// }
