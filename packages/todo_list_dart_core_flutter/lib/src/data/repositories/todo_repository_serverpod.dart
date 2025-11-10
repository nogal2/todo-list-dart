import 'package:todo_list_dart_client/todo_list_dart_client.dart';
import 'package:todo_list_dart_core/todo_list_dart_core.dart';

import '../adapters/adapters.dart';

class TodoRepositoryServerpod extends TodoRepository {
  factory TodoRepositoryServerpod() => instance;

  TodoRepositoryServerpod._instantiate();

  static final TodoRepositoryServerpod instance =
      TodoRepositoryServerpod._instantiate();

  List<TodoModel> todos = <TodoModel>[];

  @override
  Future<TodoModel> create(TodoModel todo) async {
    await client.todo.addTodo(todo.toEntity);
    return todo;
  }

  @override
  Future<void> deleteById(TodoModel todo) async {
    await client.todo.deleteTodo(todo.toEntity);
  }

  @override
  Future<List<TodoModel>> getAll() async {
    final List<TodoEntity> todos = await client.todo.getTodos();
    this.todos = todos.map((TodoEntity todo) => todo.toModel).toList();
    return this.todos;
  }

  @override
  Future<TodoModel> update(TodoModel todo) async {
    final TodoEntity updatedTodo = await client.todo.updateTodo(todo.toEntity);
    todos = todos
        .map(
          (TodoModel todo) =>
              todo.id == updatedTodo.id ? updatedTodo.toModel : todo,
        )
        .toList();
    return todo;
  }
}
