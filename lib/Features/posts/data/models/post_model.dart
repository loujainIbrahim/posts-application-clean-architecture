
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';

class PostModel extends PostEntity{
  PostModel({ super.id, required super.title, required super.body});
  factory PostModel.fromJson(Map<String,dynamic>json){
    return PostModel(id:json['id'],title:json['title'],body:json['body']);
  }
  Map<String,dynamic> toJson(){
    return {'id':id,
      'title':title,
      'body':body
  };
}
}