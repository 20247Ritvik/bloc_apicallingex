import 'package:bloc_apicallingex/todo/cubit/todo_cubit.dart';
import 'package:bloc_apicallingex/todo/cubit/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();

}

class _TodoPageState extends State<TodoPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final cubit = context.read<TodoCubit>();
      cubit.fetchTodo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
      if (state is InitState || state is LoadingState) {
        return Center(child: CircularProgressIndicator());
      } else if (state is ResponseState) {
        final todos = state.todos;
        return ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              final todo = todos[index];
              return ListTile(
                title: Text(todo.title.toString()),
              );
            });
      }
      return Center(
        child: Text(state.toString()),
      );
    }));
  }
}
