// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:water_delivery/model/product_model.dart';
// import 'package:water_delivery/model/user_model.dart';

// class ApiService {
//   static const String baseUrl = 'https://zamzaam.onrender.com';
//   static final Dio dio = Dio(
//     BaseOptions(
//       baseUrl: baseUrl,
//       headers: {'Content-Type': 'application/json'},
//     ),
//   );

//   // تسجيل مستخدم جديد
//   static Future<Response> registerUser(ProductModel user) async {
//     try {
//       final response = await dio.post(
//         '/users/',
//         data: jsonEncode(user.toJson()),
//       );
//       return response;
//     } catch (e) {
//       throw Exception('Failed to register user: $e');
//     }
//   }

//   // تسجيل الدخول
//   static Future<Response> loginUser(String email, String password) async {
//     try {
//       final response = await dio.post(
//         '/login/',
//         data: jsonEncode({
//           'email': email,
//           'password': password,
//         }),
//       );
//       return response;
//     } catch (e) {
//       throw Exception('Failed to login: $e');
//     }
//   }
// }
