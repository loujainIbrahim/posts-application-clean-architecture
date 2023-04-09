import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/presentation/widgets/DetailWidgets/DeleteBtn.dart';
import 'package:posts_application/Features/posts/presentation/widgets/DetailWidgets/UpdateBtn.dart';

import '../../bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import '../../pages/AddUpdatePage.dart';

class DetailWidget extends StatelessWidget {
   DetailWidget({Key? key, required this.post}) : super(key: key);
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(post.title),
          Text(post.body),
          Row(
            children: [
              UpdateBtn(post,context),
              DeleteBtn( id: post.id!,)
            ],
          )
        ],
      ),
    );
    ;
  }
}
