import 'package:dartz/dartz.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/domain/repositories/post_repository.dart';
import 'package:posts_application/core/errors/failure.dart';

class GetAllPostsUseCase {
  PostRepository postrepository;
  GetAllPostsUseCase(this.postrepository);

  Future<Either<Failure,List<PostEntity>>> call()async{
    return await postrepository.GetAllPost();
  }
}