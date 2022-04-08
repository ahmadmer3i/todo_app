part of 'todo_list_cubit.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;

  @override
  List<Object> get props => [todos];

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(todoTitle: 'Go to university', id: '1'),
      Todo(todoTitle: 'Wash your clothes', id: '2'),
      Todo(todoTitle: 'Study Flutter', id: '3'),
      Todo(todoTitle: 'Buy food', id: '4'),
    ]);
  }

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  const TodoListState({
    required this.todos,
  });

  @override
  String toString() {
    return 'TodoListState{todos: $todos}';
  }
}
