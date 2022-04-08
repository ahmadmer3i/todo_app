part of 'todo_search_cubit.dart';

class TodoSearchState extends Equatable {
  final String searchString;

  const TodoSearchState({
    required this.searchString,
  });

  factory TodoSearchState.initial() {
    return const TodoSearchState(searchString: '');
  }

  @override
  List<Object> get props => [searchString];

  @override
  String toString() {
    return 'TodoSearchState{searchString: $searchString}';
  }

  TodoSearchState copyWith({
    String? searchString,
  }) {
    return TodoSearchState(
      searchString: searchString ?? this.searchString,
    );
  }
}
