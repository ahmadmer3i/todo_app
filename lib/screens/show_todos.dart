import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/cubits/filtered_todos/filtered_todo_cubit.dart';
import 'package:todo_app_saad/cubits/todo_list/todo_list_cubit.dart';

class ShowTodos extends StatelessWidget {
  ShowTodos({Key? key}) : super(key: key);
  final editController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var todos = context.watch<FilteredTodoCubit>().state.filteredTodos;
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Dismissible(
          onDismissed: (_) {
            context.read<TodoListCubit>().deleteTodo(todos[index]);
          },
          confirmDismiss: (_) {
            return showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    title: const Text('Are you sure?'),
                    content: const Text('Do you want to delete this item?'),
                    actions: [
                      CupertinoDialogAction(
                        isDefaultAction: true,
                        child: const Text(
                          'Delete',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                      ),
                      CupertinoDialogAction(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                      ),
                    ],
                  );
                });
          },
          background: setBackroundColor(0),
          secondaryBackground: setBackroundColor(1),
          key: ValueKey(todos[index].id),
          child: ListTile(
            onTap: () {
              editController.text = todos[index].todoTitle;
              showCupertinoDialog(
                  context: context,
                  builder: (context) {
                    return CupertinoAlertDialog(
                      title: const Text('Are you sure?'),
                      content: CupertinoTextField(
                        controller: editController,
                        placeholder: 'Edit Title',
                      ),
                      actions: [
                        CupertinoDialogAction(
                          isDefaultAction: true,
                          child: const Text(
                            'Edit',
                            style: TextStyle(color: Colors.green),
                          ),
                          onPressed: () {
                            context
                                .read<TodoListCubit>()
                                .editTodo(todos[index].id, editController.text);
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: const Text('Cancel'),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  });
            },
            leading: Checkbox(
              onChanged: (bool? value) {
                context.read<TodoListCubit>().toggleTodo(todos[index].id);
              },
              value: todos[index].isCompleted,
            ),
            title: Text(todos[index].todoTitle),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(
        color: Colors.grey,
        indent: 10,
        endIndent: 10,
      ),
      itemCount: todos.length,
    );
  }

  Widget setBackroundColor(int direction) {
    return Container(
      color: Colors.red,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
      ),
      alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
    );
  }
}
