import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:posts_application/Features/posts/presentation/pages/AddUpdatePage.dart';
import 'package:posts_application/Features/posts/presentation/widgets/PostsWidgest/ErrorMessageWidget.dart';
import 'package:posts_application/Features/posts/presentation/widgets/PostsWidgest/PostsWidget.dart';
import 'package:posts_application/core/widgets/Widget.dart';

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Posts"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return LoadingWidget();
          } else if (state is LoadedState) {
            return RefreshIndicator(
                onRefresh: () => _refreshPage(context),
                child: PostsWisget(state.posts));
          } else if (state is ErrorState) {
            return ErrorMessageWidget(state.message, context);
          }
          return LoadingWidget();
        },
      ),
      floatingActionButton: _floatingBtn(context),
    );
  }

  Future<void> _refreshPage(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshEvent());
  }

  Widget _floatingBtn(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>  AddUpdatePage(
                      isUpdate: false,
                    )));
      },
      child:  Icon(Icons.add),
    );
  }
}
