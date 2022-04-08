import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/cubits/todo_list/todo_list_cubit.dart';
import 'package:todo_app_saad/models/todo_model.dart';

part 'active_todo_state.dart';

class ActiveTodoCubit extends Cubit<ActiveTodoState> {
  late final StreamSubscription todoListSubscription;
  final TodoListCubit todoListCubit;
  final int initialCount;
  ActiveTodoCubit({required this.todoListCubit, required this.initialCount})
      : super(ActiveTodoState(counter: initialCount)) {
    todoListSubscription = todoListCubit.stream.listen((TodoListState state) {
      setTodoList();
    });
  }

  void setTodoList() {
    final currentActiveTodoCount = todoListCubit.state.todos
        .where((Todo todo) => !todo.isCompleted)
        .toList()
        .length;
    emit(state.copyWith(counter: currentActiveTodoCount));
  }

  @override
  Future<void> close() {
    todoListSubscription.cancel();
    return super.close();
  }
}
