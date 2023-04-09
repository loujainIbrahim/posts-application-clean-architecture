import 'package:dartz/dartz.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/domain/repositories/post_repository.dart';
import 'package:posts_application/core/errors/failure.dart';

class AddPostUseCase {
  final PostRepository postRepository;

  AddPostUseCase( this.postRepository);
  Future<Either<Failure,Unit>> call(PostEntity post)async{
    return await postRepository.AddPost(post );
  }
}