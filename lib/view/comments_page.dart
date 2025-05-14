import 'package:flutter/material.dart';
import 'package:intro_to_isolate/model/comment_model.dart';
import 'package:intro_to_isolate/service/comment_service.dart';


class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Comments" ,  style: TextStyle(fontSize: 20,fontWeight : FontWeight.w700,color: Colors.black),)),
      body: FutureBuilder<List<CommentModel>>(
        future: CommentService.fetchComments(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return  Center(child: CircularProgressIndicator());
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return  Center(child: Text("No comments found"));
          }

          final comments = snapshot.data!;
          return ListView.separated(
            itemCount: comments.length,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, index) {
              final comment = comments[index];
              return ListTile(
                title: Text(comment.name, style: TextStyle(fontSize: 15,fontWeight : FontWeight.w500,color: Colors.black),),
                subtitle: Text(comment.body),
                trailing: Text(comment.id.toString() ,  style: TextStyle(fontSize: 12,fontWeight : FontWeight.w400,color: Colors.black),),
             
              );
            },
          );
        },
      ),
    );
  }
}
