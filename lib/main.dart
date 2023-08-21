import 'package:bloc_apicallingex/repository/repository.dart';
import 'package:bloc_apicallingex/todo/cubit/todo_cubit.dart';
import 'package:bloc_apicallingex/todo/views/todo_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => TodoCubit(TodoRepository()),
      child: MaterialApp(
        home: TodoPage(),
      ),
    );
  }
}
