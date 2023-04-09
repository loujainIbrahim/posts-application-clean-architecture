import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/presentation/widgets/DetailWidgets/DeleteDialog.dart';
import 'package:posts_application/core/strings/messages.dart';
import 'package:posts_application/core/widgets/Widget.dart';
import 'package:posts_application/core/widgets/snakeBar.dart';

import '../../bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import '../../pages/PostsPage.dart';

class DeleteBtn extends StatefulWidget {
  const DeleteBtn({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  State<DeleteBtn> createState() => _DeleteBtnState();
}

class _DeleteBtnState extends State<DeleteBtn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton.icon(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return BlocConsumer<AddDeleteUpdateBloc,
                      AddDeleteUpdateState>(builder: (context, state) {
                    if (state is LoadingState) {
                      return AlertDialog(
                        title: LoadingWidget(),
                      );
                    } else
                      return DeleteDialog(id:widget.id);
                  }, listener: (context, state) {
                    if (state is SuccessAddDeleteUpdateState) {
                      Navigator.of(context).pop();
                      SnakeBar(DELETE_SUCCESS_MESSAGE, context, true);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (_) => PostsPage()),
                          (route) => false);
                    }
                    else if(state is ErrorAddDeleteUpdateState){
                       Navigator.of(context).pop();
                       SnakeBar("Delete post Failed", context, false);
                    }
                  });
                });
          },
          icon: Icon(Icons.delete),
          label: Text("Delete"),

      ) );
  }
}
