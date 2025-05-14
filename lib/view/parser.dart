import 'dart:convert';
import 'package:intro_to_isolate/model/comment_model.dart';

List<CommentModel> parseComments(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<CommentModel>((json) => CommentModel.fromJson(json)).toList();
}
