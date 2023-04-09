import 'package:dartz/dartz.dart';
import 'package:posts_application/Features/posts/domain/repositories/post_repository.dart';
import 'package:posts_application/core/errors/failure.dart';

class DeletePostUseCase{
  PostRepository postrepository;
  DeletePostUseCase(this.postrepository);
Future<Either<Failure,Unit>> call(int id)async{
  return await postrepository.DeletePost(id);
}

}