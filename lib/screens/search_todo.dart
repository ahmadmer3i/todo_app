import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_saad/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_saad/models/todo_model.dart';

class SearchTodo extends StatelessWidget {
  const SearchTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CupertinoSearchTextField(
          onChanged: (value) {
            context.read<TodoSearchCubit>().setSearchString(value);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
                onPressed: () {
                  context.read<TodoFilterCubit>().setTodoFilter(Filter.all);
                },
                child: Text('All',
                    style: TextStyle(color: setColor(context, Filter.all)))),
            TextButton(
              onPressed: () {
                context.read<TodoFilterCubit>().setTodoFilter(Filter.active);
              },
              child: Text('Active',
                  style: TextStyle(color: setColor(context, Filter.active))),
            ),
            TextButton(
                onPressed: () {
                  context
                      .read<TodoFilterCubit>()
                      .setTodoFilter(Filter.completed);
                },
                child: Text(
                  'Completed',
                  style: TextStyle(color: setColor(context, Filter.completed)),
                )),
          ],
        )
      ],
    );
  }

  Color setColor(BuildContext context, Filter filter) {
    return context.watch<TodoFilterCubit>().state.filter == filter
        ? Colors.blue
        : Colors.grey;
  }
}
