import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo/data/models/todo.dart';
import 'package:todo/data/repositories/todo_repository.dart';
import 'package:todo/data/repositories/user_repositories.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc({required TodoRepository todoRepository})
      : super(TodosLoadInProgress()) {
    _todoRepository = todoRepository;
    on<TodosLoaded>(_onTodosLoaded);
    on<TodoAdded>(_onTodoAdded);
  }

  late TodoRepository _todoRepository;
  late StreamSubscription _todosSubscription;

  void _onTodosLoaded(TodosLoaded event, Emitter emit) async {
    try {
      final UserRepository _userRepository = UserRepository(null);

      // _todosSubscription.cancel();
      _todosSubscription = _todoRepository
          .requestTodoStream(await _userRepository.getUserId())
          .listen((todos) {
        add(TodoUpdated(todos));
      });
    } catch (e) {
      emit(TodosLoadFailure());
    }
  }

  void _onTodoAdded(TodoAdded event, Emitter emit) async {
    final UserRepository _userRepository = UserRepository(null);

    await _todoRepository.addTodo(
        await _userRepository.getUserId(), event.todo);
  }

  @override
  Future<void> close() {
    _todosSubscription.cancel();
    return super.close();
  }
}
