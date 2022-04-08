part of 'todo_filter_cubit.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }

  @override
  List<Object> get props => [filter];

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  const TodoFilterState({
    required this.filter,
  });
}