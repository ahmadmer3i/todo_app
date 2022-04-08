import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter {
  all,
  active,
  completed,
}

Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String todoTitle;
  final bool isCompleted;

  Todo({
    String? id,
    required this.todoTitle,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, todoTitle, isCompleted];

  @override
  String toString() {
    return 'Todo{id: $id, todoTitle: $todoTitle, isCompleted: $isCompleted}';
  }
}
