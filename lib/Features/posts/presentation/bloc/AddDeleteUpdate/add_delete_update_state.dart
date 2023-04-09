part of 'add_delete_update_bloc.dart';

abstract class AddDeleteUpdateState extends Equatable {
  const AddDeleteUpdateState();
}

class AddDeleteUpdateInitial extends AddDeleteUpdateState {
  @override
  List<Object> get props => [];
}

class LoadingState extends AddDeleteUpdateState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();


}
class SuccessAddDeleteUpdateState extends AddDeleteUpdateState{
  final String message;

  SuccessAddDeleteUpdateState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
class ErrorAddDeleteUpdateState extends AddDeleteUpdateState{
  final String message;

  ErrorAddDeleteUpdateState({required this.message});

  @override
  // TODO: implement props
  List<Object?> get props => [message];

}