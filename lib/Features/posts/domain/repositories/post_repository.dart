import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:posts_application/core/errors/failure.dart';
abstract class PostRepository{
  Future<Either<Failure,Unit>>AddPost(PostEntity post);
  Future<Either<Failure,Unit>>DeletePost(int id);
  Future<Either<Failure,List<PostEntity>>>GetAllPost();
  Future<Either<Failure,Unit>>UpdatePost(PostEntity post);

}