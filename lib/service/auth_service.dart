import 'package:dio/dio.dart';
import 'package:water_delivery/model/auth_model.dart';

class AuthService {
  final Dio _dio = Dio();
  final String baseUrl = 'https://zamzaam.onrender.com/users/';
Future<void> register(AuthModel user) async {
  try {
    final response = await _dio.post(
      baseUrl,
      data: user.toJson(),
      options: Options(
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
        },
      ),
    );

    print(' Registration success: ${response.data}');
  } catch (e) {
    print("Registering with: ${user.toJson()}");
    if (e is DioException) {
      print(" DioException: ${e.response?.data}");
    }
    throw Exception(e is DioException 
    ? e.response?.data["message"] ?? "Unknown error" 
    : e.toString());

  }
}

}
