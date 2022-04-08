import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app_saad/models/todo_model.dart';

part 'todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String title) {
    final newTodo = Todo(todoTitle: title);
    final newTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newTodos));
  }

  void editTodo(String id, String title) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
            id: todo.id, todoTitle: title, isCompleted: todo.isCompleted);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
            id: todo.id,
            todoTitle: todo.todoTitle,
            isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void deleteTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
