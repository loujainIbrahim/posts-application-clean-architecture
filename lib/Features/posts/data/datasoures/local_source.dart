import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_application/Features/posts/data/models/post_model.dart';
import 'package:posts_application/core/errors/exception.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalSource {
  Future<Unit> CachePosts(List<PostModel> postsModel);
  Future<List<PostModel>> GetCachedPosts();
}

const String KEY = "CACHE";

class LocalSourceWithSharedPreferences implements LocalSource {
  final SharedPreferences sharedPreferences;

  LocalSourceWithSharedPreferences({required this.sharedPreferences});
  @override
  Future<Unit> CachePosts(List<PostModel> postsModel) {
    List toJson = postsModel
        .map<Map<String, dynamic>>((postmodel) => postmodel.toJson())
        .toList();
    sharedPreferences.setString(KEY, json.encode(toJson));
    return Future.value(unit);
  }

  @override
  Future<List<PostModel>> GetCachedPosts() {
    final toModel = sharedPreferences.getString(KEY);
    if (toModel != null) {
      List dataToModel = json.decode(toModel);
      List<PostModel> listModel = dataToModel
          .map<PostModel>((json) => PostModel.fromJson(json))
          .toList();
      return Future.value(listModel);
    } else {
      throw CacheEception();
    }
  }
}
