import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/presentation/pages/AddUpdatePage.dart';

Widget UpdateBtn (PostEntity post,BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
        icon: Icon(Icons.edit),
          label:Text("Edit") ,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) =>  AddUpdatePage(
                      isUpdate: true,
                      post: post,
                    )));
          },
      )
    );
  }

