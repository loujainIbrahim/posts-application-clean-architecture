part of 'posts_bloc.dart';

abstract class PostsState extends Equatable {
  const PostsState();
}

class PostsInitial extends PostsState {
  @override
  List<Object> get props => [];
}
class LoadingState extends PostsState{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class LoadedState extends PostsState{
  final
  List<PostEntity>posts;

  LoadedState({required this.posts});
  @override

  List<Object?> get props => [posts];
}
class ErrorState extends PostsState{
  final String message;

  ErrorState({required this.message});
  @override

  List<Object?> get props =>[message];
}