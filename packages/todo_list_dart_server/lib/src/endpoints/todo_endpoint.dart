import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class TodoEndpoint extends Endpoint {
  // C (Create)
  Future<TodoEntity> addTodo(Session session, TodoEntity todo) async {
    await TodoEntity.db.insertRow(session, todo);
    return todo;
  }

  // R (Read)
  Future<List<TodoEntity>> getTodos(Session session) async {
    return TodoEntity.db.find(
      session,
      orderBy: (TodoEntityTable t) => t.id,
    );
  }

  // U (Update)
  Future<TodoEntity> updateTodo(Session session, TodoEntity todo) async {
    await TodoEntity.db.updateRow(session, todo);
    return todo;
  }

  // D (Delete)
  Future<TodoEntity> deleteTodo(Session session, TodoEntity todo) async {
    final TodoEntity result = await TodoEntity.db.deleteRow(session, todo);
    return result;
  }
}
