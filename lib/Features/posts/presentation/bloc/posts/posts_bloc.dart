import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:posts_application/Features/posts/data/models/post_model.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_application/core/errors/failure.dart';
import 'package:posts_application/core/strings/failures.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final GetAllPostsUseCase getAllPostsUseCase;
  PostsBloc({required this.getAllPostsUseCase}) : super(PostsInitial()) {
    on<PostsEvent>((event, emit) async{
     if(event is GetAllPostsEvent|| event is RefreshEvent) {
        emit(LoadingState());
        final Posts = await getAllPostsUseCase();
       emit( PostOrFailure(Posts));
      }
    });
  }
  String getMessage(Failure failure){
    switch(failure.runtimeType){
      case(ServerFailure):return SERVER_FAILURE_MESSAGE;
      case(CacheFailure):return EMPTY_CACHE_FAILURE_MESSAGE;
      case(OfflineFailure):return OFFLINE_FAILURE_MESSAGE;
      default:return"Unexpected error";
    }
  }
  PostsState PostOrFailure(Either<Failure, List<PostEntity>> either){
   return either.fold((failue) =>
      ErrorState(message: getMessage(failue))
    , (posts) =>
      LoadedState(posts: posts)
    );
  }
}
