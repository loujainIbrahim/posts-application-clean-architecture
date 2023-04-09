import 'package:get_it/get_it.dart' ;
import 'package:posts_application/Features/posts/data/datasoures/local_source.dart';
import 'package:posts_application/Features/posts/data/datasoures/remote_source.dart';
import 'package:posts_application/Features/posts/data/repositories/post__repository_impl.dart';
import 'package:posts_application/Features/posts/domain/repositories/post_repository.dart';
import 'package:posts_application/Features/posts/domain/usecases/add_post.dart';
import 'package:posts_application/Features/posts/domain/usecases/delete_post.dart';
import 'package:posts_application/Features/posts/domain/usecases/get_all_posts.dart';
import 'package:posts_application/Features/posts/domain/usecases/update_post.dart';
import 'package:posts_application/core/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Features/posts/presentation/bloc/AddDeleteUpdate/add_delete_update_bloc.dart';
import 'Features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;
//bloc
Future<void> init() async {
  sl.registerFactory(() => PostsBloc(getAllPostsUseCase: sl()));

  sl.registerFactory(() => AddDeleteUpdateBloc(
      addPostUseCase: sl(), deletePostUseCase: sl(), updatePostUseCase: sl()));

  //use cases
  sl.registerLazySingleton(() => AddPostUseCase(sl()));
  sl.registerLazySingleton(() => GetAllPostsUseCase(sl()));
  sl.registerLazySingleton(() => DeletePostUseCase(sl()));
  sl.registerLazySingleton(() => UpdatePostUseCase(sl()));
//repository
  sl.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      localSource: sl(), remoteSource: sl(), networkChecker: sl()));
//DataSources
  sl.registerLazySingleton<LocalSource>(
      () => LocalSourceWithSharedPreferences(sharedPreferences: sl()));
  sl.registerLazySingleton<RemoteSource>(
      () => RemoteSourceWithHttp(client: sl()));
//network checker
  sl.registerLazySingleton<NetworkChecker>(() => NetworkCheckerWithPackage());
//shared preferences
  final s = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => s);
//client
  sl.registerLazySingleton(() => http.Client());
}
