import 'package:bloc_apicallingex/model/modelclass.dart';

abstract class TodoState {}

class InitState extends TodoState {}

class LoadingState extends TodoState {}

class ErrorState extends TodoState {
  final String message;
  ErrorState(this.message);
}

class ResponseState extends TodoState {
  final List<User> todos;

  ResponseState(this.todos);
}
