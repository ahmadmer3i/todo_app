import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/cubits/active_todo/active_todo_cubit.dart';
import 'package:todo_app_saad/cubits/filtered_todos/filtered_todo_cubit.dart';
import 'package:todo_app_saad/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_saad/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_saad/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_saad/screens/todo_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoListCubit>(
          create: (context) => TodoListCubit(),
        ),
        BlocProvider<ActiveTodoCubit>(
          create: (context) => ActiveTodoCubit(
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
            initialCount: context.read<TodoListCubit>().state.todos.length,
          ),
        ),
        BlocProvider<TodoSearchCubit>(
          create: (context) => TodoSearchCubit(),
        ),
        BlocProvider<TodoFilterCubit>(
          create: (context) => TodoFilterCubit(),
        ),
        BlocProvider<FilteredTodoCubit>(
          create: (context) => FilteredTodoCubit(
            initialTodos: BlocProvider.of<TodoListCubit>(context).state.todos,
            todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context),
            todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
            todoListCubit: BlocProvider.of<TodoListCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const TodoHome(),
      ),
    );
  }
}
