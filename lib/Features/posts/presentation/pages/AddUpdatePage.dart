import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/presentation/bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import 'package:posts_application/Features/posts/presentation/pages/PostsPage.dart';
import 'package:posts_application/Features/posts/presentation/widgets/AddUpdateWidgets/FormWidget.dart';
import 'package:posts_application/core/strings/messages.dart';
import 'package:posts_application/core/widgets/Widget.dart';
import 'package:posts_application/core/widgets/snakeBar.dart';

class AddUpdatePage extends StatefulWidget {
   AddUpdatePage({Key? key, required this.isUpdate, this.post})
      : super(key: key);
  final bool isUpdate;
  final PostEntity? post;

  @override
  State<AddUpdatePage> createState() => _AddUpdatePageState();
}

class _AddUpdatePageState extends State<AddUpdatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildBar(),
      body: BlocConsumer<AddDeleteUpdateBloc, AddDeleteUpdateState>(
          listener: (context, state) {
            if(state is ErrorAddDeleteUpdateState){
             SnakeBar("Add post failed", context, false);
            }
            else if(state is SuccessAddDeleteUpdateState){
              SnakeBar(ADD_SUCCESS_MESSAGE, context, true);
              Navigator.push(context, MaterialPageRoute(builder: (_)=>PostsPage()));
            }
          },
          builder: (context, state) {
            if(state is LoadingState){
              return LoadingWidget();
            }
            else {
              return _buildBody();
            }
          },

      ),
    );
  }

  AppBar _buildBar() {
    return AppBar(title: Text(widget.isUpdate ? 'Update post' : 'Add post'));
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.all(10),
      child: FormWidget(
          isUpdate: widget.isUpdate,
          post: widget.isUpdate ? widget.post : null),
    );
  }
}
