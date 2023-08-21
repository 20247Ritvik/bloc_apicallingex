import 'package:bloc_apicallingex/todo/cubit/todo_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/repository.dart';

class TodoCubit extends Cubit<TodoState> {

  final TodoRepository _repository;
  TodoCubit(this._repository) : super(InitState());

  Future<void> fetchTodo() async {
    emit(LoadingState());
    try {
      final response = await _repository.getAll();
      emit(ResponseState(response));
    } catch (e) {
      emit(ErrorState(e.toString()));
    }
  }
}
