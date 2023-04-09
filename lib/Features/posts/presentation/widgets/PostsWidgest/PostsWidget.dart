import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/presentation/pages/post_details.dart';

Widget PostsWisget(List<PostEntity> posts) {
  return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
                leading: Text(posts[index].id.toString()),
                title: Text(posts[index].title),
                subtitle: Text(posts[index].body),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) =>
                              PostDetails(post: posts[index])));
                },
              ),
          separatorBuilder: (context, index) => const Divider(
                thickness: 1,
              ),
          itemCount: posts.length));
}
