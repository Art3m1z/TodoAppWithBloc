part of "todo_bloc.dart";

sealed class TodoEvents {}

class AddTodo extends TodoEvents {
  final String todoText;

  AddTodo(this.todoText);
}