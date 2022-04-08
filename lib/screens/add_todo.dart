import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/cubits/todo_list/todo_list_cubit.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key? key}) : super(key: key);

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: searchController,
      placeholder: 'Add Todo',
      padding: const EdgeInsets.all(10),
      onSubmitted: (String? value) {
        if (value != null && value.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodo(value);
          searchController.clear();
        }
      },
    );
  }
}
