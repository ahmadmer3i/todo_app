import 'package:flutter/material.dart';
import 'package:todo_app_saad/screens/add_todo.dart';
import 'package:todo_app_saad/screens/search_todo.dart';
import 'package:todo_app_saad/screens/show_todos.dart';
import 'package:todo_app_saad/screens/todo_header.dart';

class TodoHome extends StatelessWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              children: [
                TodoHeader(),
                SearchTodo(),
                AddTodo(),
                ShowTodos(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
