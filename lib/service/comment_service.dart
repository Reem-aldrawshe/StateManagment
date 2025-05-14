import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:intro_to_isolate/model/comment_model.dart';
import 'package:intro_to_isolate/view/parser.dart';

class CommentService {
  static Future<List<CommentModel>> fetchComments() async {
    Dio dio = Dio();
    Response response = await dio.get("https://jsonplaceholder.typicode.com/comments");

   
    String rawJson = jsonEncode(response.data);
    return compute(parseComments, rawJson);
  }

}
