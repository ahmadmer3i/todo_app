import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/cubits/todo_filter/todo_filter_cubit.dart';
import 'package:todo_app_saad/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_saad/cubits/todo_search/todo_search_cubit.dart';
import 'package:todo_app_saad/models/todo_model.dart';

part 'filtered_todo_state.dart';

class FilteredTodoCubit extends Cubit<FilteredTodoState> {
  late StreamSubscription todoListSubscription;
  late StreamSubscription searchTodoSubscription;
  late StreamSubscription todoFilterSubscription;

  final List<Todo> initialTodos;

  final TodoListCubit todoListCubit;
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  FilteredTodoCubit(
      {required this.initialTodos,
      required this.todoSearchCubit,
      required this.todoFilterCubit,
      required this.todoListCubit})
      : super(FilteredTodoState(filteredTodos: initialTodos)) {
    todoFilterSubscription = todoFilterCubit.stream.listen((state) {
      setFilter();
    });
    todoListSubscription = todoListCubit.stream.listen((state) {
      setFilter();
    });
    searchTodoSubscription = todoSearchCubit.stream.listen((state) {
      setFilter();
    });
  }

  void setFilter() {
    List<Todo> _filteredTodo;
    switch (todoFilterCubit.state.filter) {
      case Filter.completed:
        _filteredTodo = todoListCubit.state.todos
            .where((Todo todo) => todo.isCompleted)
            .toList();
        break;
      case Filter.active:
        _filteredTodo = todoListCubit.state.todos
            .where((Todo todo) => !todo.isCompleted)
            .toList();
        break;
      case Filter.all:
      default:
        _filteredTodo = todoListCubit.state.todos;
    }
    if (todoSearchCubit.state.searchString.isNotEmpty) {
      _filteredTodo = todoListCubit.state.todos.where((Todo todo) {
        return todo.todoTitle
            .toLowerCase()
            .contains(todoSearchCubit.state.searchString);
      }).toList();
    }
    emit(state.copyWith(filteredTodos: _filteredTodo));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    searchTodoSubscription.cancel();
    todoListSubscription.cancel();
    return super.close();
  }
}
