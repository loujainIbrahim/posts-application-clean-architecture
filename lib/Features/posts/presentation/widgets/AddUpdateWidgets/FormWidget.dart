import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/presentation/bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import 'package:posts_application/Features/posts/presentation/widgets/AddUpdateWidgets/FormItem.dart';

class FormWidget extends StatefulWidget {
   FormWidget( {Key? key,  required this.isUpdate, this.post}):  super(key: key);
  final bool isUpdate;
  final PostEntity? post;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
   TextEditingController _titleController=TextEditingController();
   TextEditingController _bodyController=TextEditingController();
   final _myKey=GlobalKey<FormState>();
   @override
  void initState() {
   if (widget.isUpdate){
    _titleController.text=widget.post!.title;
    _bodyController.text=widget.post!.body;
    super.initState();
  }}
  @override
  Widget build(BuildContext context) {
    return Form(
      key:_myKey,
      child: Column(
        children: [
          FormItem(controller: _titleController,isTitle:true),
          FormItem(controller: _bodyController,isTitle:false),
          ElevatedButton(onPressed: (){
            if(_myKey.currentState!.validate()){
              final post=PostEntity(title: _titleController.text, body:_bodyController.text ,
                id: widget.isUpdate ? widget.post!.id : null);
            if(widget.isUpdate) {
              BlocProvider.of<AddDeleteUpdateBloc>(context).add(UpdateEvent(post:post));
            } else {
              BlocProvider.of<AddDeleteUpdateBloc>(context).add(AddEvent(post:post));
            }
            }
          },
              child:Text(widget.isUpdate?'Update post':'Add post') ),
        ],
      ),
    );
  }
}
