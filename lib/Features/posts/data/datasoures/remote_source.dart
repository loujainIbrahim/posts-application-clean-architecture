import 'dart:async';
import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:posts_application/Features/posts/data/models/post_model.dart';
import 'package:http/http.dart' as http;
import 'package:posts_application/core/errors/exception.dart';

abstract class RemoteSource {
  Future<Unit> AddPost(PostModel post);
  Future<Unit> DeletePost(int id);
  Future<List<PostModel>> GetAllPost();
  Future<Unit> UpdatePost(PostModel post);
}

const BASE_URL = "https://jsonplaceholder.typicode.com";

class RemoteSourceWithHttp implements RemoteSource {
  final http.Client client;

  RemoteSourceWithHttp({required this.client});

  @override
  Future<List<PostModel>> GetAllPost() async {
    final response = await client.get(Uri.parse("$BASE_URL/posts/"),
        headers: {"Content-Type": "application/json"});
    if (response.statusCode == 200) {
      final List JsonData = json.decode(response.body) as List;
      final List<PostModel> DataModel =
          JsonData.map<PostModel>((json) => PostModel.fromJson(json)).toList();
      return DataModel;
    } else {
      throw ServerEception();
    }
  }

  @override
  Future<Unit> AddPost(PostModel post) async {
    final body = {"title": post.title, "body": post.body};
    final response =
        await client.post(Uri.parse("$BASE_URL/posts/"), body: body);
    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServerEception();
    }
  }

  @override
  Future<Unit> DeletePost(int id) async {
    final String id_post = id.toString();
    final response = await client.delete(Uri.parse("$BASE_URL/posts/$id_post"));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerEception();
    }
  }

  @override
  Future<Unit> UpdatePost(PostModel post) async {
    final body = {"title": post.title, "body": post.body};
    final String id_post = post.id.toString();
    final response = await client.patch(Uri.parse("$BASE_URL/posts/$id_post"));
    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServerEception();
    }
  }
}
