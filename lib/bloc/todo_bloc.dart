import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/todoModel.dart';
part 'todo_events.dart';

class TodoBloc extends Bloc<TodoEvents, List<Todo>> {
  TodoBloc() : super([]) {
    on<AddTodo>((event, emit){
      state.add(Todo(text: event.todoText, date: DateTime.now().toString().split(' ')[0]));
      emit(List.from(state));
    });
  }
}