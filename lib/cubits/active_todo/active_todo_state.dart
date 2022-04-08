part of 'active_todo_cubit.dart';

class ActiveTodoState extends Equatable {
  final int counter;

  const ActiveTodoState({
    required this.counter,
  });
  factory ActiveTodoState.initial() {
    return const ActiveTodoState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  @override
  String toString() {
    return 'ActiveTodoState{counter: $counter}';
  }

  ActiveTodoState copyWith({
    int? counter,
  }) {
    return ActiveTodoState(
      counter: counter ?? this.counter,
    );
  }
}
