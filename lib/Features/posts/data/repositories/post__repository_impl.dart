import 'package:dartz/dartz.dart';
import 'package:posts_application/Features/posts/data/datasoures/local_source.dart';
import 'package:posts_application/Features/posts/data/datasoures/remote_source.dart';
import 'package:posts_application/Features/posts/data/models/post_model.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/domain/repositories/post_repository.dart';
import 'package:posts_application/core/errors/exception.dart';
import 'package:posts_application/core/errors/failure.dart';
import 'package:posts_application/core/network.dart';

typedef Future<Unit> deleteOrAddOrIpdate();

class PostRepositoryImpl implements PostRepository {
  final LocalSource localSource;
  final RemoteSource remoteSource;
  final NetworkChecker networkChecker;
  PostRepositoryImpl(
      {required this.localSource,
      required this.remoteSource,
      required this.networkChecker});

  @override
  Future<Either<Failure, List<PostEntity>>> GetAllPost() async {
    if (await networkChecker.isConnect) {
      try {
        final remoteData = await remoteSource.GetAllPost();
        localSource.CachePosts(remoteData);
        return right(remoteData);
      } on ServerEception {
        return left(ServerFailure());
      }
    } else {
      try {
        final localData = await localSource.GetCachedPosts();
        return right(localData);
      } on CacheEception {
        return left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> AddPost(PostEntity Post) async {
    PostModel post = PostModel( title: Post.title, body: Post.body);
    return await getData(() => remoteSource.AddPost(post));
  }

  @override
  Future<Either<Failure, Unit>> DeletePost(int id) async {
    return await getData(() => remoteSource.DeletePost(id));
  }

  @override
  Future<Either<Failure, Unit>> UpdatePost(PostEntity Post) async {
    PostModel post = PostModel(id: Post.id, title: Post.title, body: Post.body);
    return await getData(() => remoteSource.UpdatePost(post));
  }

  Future<Either<Failure, Unit>> getData(deleteOrAddOrIpdate dd) async {
    if (await networkChecker.isConnect) {
      try {
        await dd();
        return right(unit);
      } on ServerEception {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }
}
