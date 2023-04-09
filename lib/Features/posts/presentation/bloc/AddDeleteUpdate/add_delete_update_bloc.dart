import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:posts_application/Features/posts/domain/entities/post_entity.dart';
import 'package:posts_application/Features/posts/domain/usecases/add_post.dart';
import 'package:posts_application/Features/posts/domain/usecases/delete_post.dart';
import 'package:posts_application/Features/posts/domain/usecases/update_post.dart';
import 'package:posts_application/core/errors/failure.dart';
import 'package:posts_application/core/strings/failures.dart';
import 'package:posts_application/core/strings/messages.dart';

part 'add_delete_update_event.dart';
part 'add_delete_update_state.dart';

class AddDeleteUpdateBloc
    extends Bloc<AddDeleteUpdateEvent, AddDeleteUpdateState> {
  final AddPostUseCase addPostUseCase;
  final DeletePostUseCase deletePostUseCase;
  final UpdatePostUseCase updatePostUseCase;
  AddDeleteUpdateBloc(
      {required this.addPostUseCase,required this.deletePostUseCase,required this.updatePostUseCase})
      : super(AddDeleteUpdateInitial()) {
    on<AddDeleteUpdateEvent>((event, emit) async {
      if (event is AddEvent) {
        emit(LoadingState());
        final response = await addPostUseCase(event.post);
        emit(ErrorOrSuccess(response, ADD_SUCCESS_MESSAGE));
      } else if (event is DeleteEvent) {
        emit(LoadingState());
        final response = await deletePostUseCase(event.id);
        emit(ErrorOrSuccess(response, DELETE_SUCCESS_MESSAGE));
      } else if (event is UpdateEvent) {
        emit(LoadingState());
        final response = await updatePostUseCase(event.post);
        emit(ErrorOrSuccess(response, UPDATE_SUCCESS_MESSAGE));
      }
    });
  }
  String getMessage(Failure failure) {
    switch (failure.runtimeType) {
      case (ServerFailure):
        return SERVER_FAILURE_MESSAGE;
      case (OfflineFailure):
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected error";
    }
  }

  AddDeleteUpdateState ErrorOrSuccess(
      Either<Failure, Unit> response, String message) {
    return response.fold(
        (l) => ErrorAddDeleteUpdateState(message: getMessage(l)),
        (r) => SuccessAddDeleteUpdateState(message: message));
  }
}
