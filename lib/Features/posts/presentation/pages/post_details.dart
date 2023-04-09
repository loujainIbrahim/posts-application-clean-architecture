import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/presentation/bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import 'package:posts_application/Features/posts/presentation/pages/AddUpdatePage.dart';
import 'package:posts_application/Features/posts/presentation/pages/PostsPage.dart';
import 'package:posts_application/Features/posts/presentation/widgets/DetailWidgets/DetailWidget.dart';
import 'package:posts_application/core/strings/messages.dart';
import 'package:posts_application/core/widgets/Widget.dart';
import 'package:posts_application/core/widgets/snakeBar.dart';

class PostDetails extends StatelessWidget {
   PostDetails({Key? key, required this.post}) : super(key: key);
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:  Text("Detail post"),
        ),
        body:_buildBody(context,post)
    );
  }

  Widget _buildBody(BuildContext context,PostEntity post) {
    return DetailWidget(post:post);
  }
}
