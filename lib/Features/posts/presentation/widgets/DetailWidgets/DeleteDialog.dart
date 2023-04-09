import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/presentation/bloc/AddDeleteUpdate/add_delete_update_bloc.dart';

class DeleteDialog extends StatefulWidget {
  DeleteDialog({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<DeleteDialog> createState() => _DeleteDialogState();
}

class _DeleteDialogState extends State<DeleteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Are you sure"),
      actions: [
        TextButton(
            onPressed: () {
              BlocProvider.of<AddDeleteUpdateBloc>(context)
                  .add(DeleteEvent(id: widget.id));
            },
            child: Text('yes')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('No')),
      ],
    );
  }
}
