part of 'add_delete_update_bloc.dart';


abstract class AddDeleteUpdateEvent {}

class AddEvent extends AddDeleteUpdateEvent {
  final PostEntity post;

  AddEvent({required this.post});

}

class UpdateEvent extends AddDeleteUpdateEvent {
  final PostEntity post;

  UpdateEvent({required this.post});

}

class DeleteEvent extends AddDeleteUpdateEvent {
  final int id;

  DeleteEvent({required this.id});
}
