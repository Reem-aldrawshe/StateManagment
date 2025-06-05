import 'package:dio/dio.dart';
import 'package:water_delivery/model/user_model.dart';

class UserService {
  final Dio _dio = Dio();
  

Future<Map<String, dynamic>> loginUser(LoginModel loginModel) async {
  try {
    final response = await _dio.post(
      'https://zamzaam.onrender.com/login',
      queryParameters: {
        'username': loginModel.username,
        'password': loginModel.password,
      },
      options: Options(
        headers: {
          'accept': 'application/json',
        },
      ),
      data: '', 
    );

    print(' Login success: ${response.data}');
    return response.data;
  } catch (e) {
    print(' Error: ${e.toString()}');
    throw Exception('Failed to login: $e');
  }
}

}
