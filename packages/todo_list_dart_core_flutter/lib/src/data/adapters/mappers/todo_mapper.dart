import 'package:todo_list_dart_client/todo_list_dart_client.dart';
import 'package:todo_list_dart_core/todo_list_dart_core.dart';

/// Converts a [TodoEntity] to a [TodoModel].
extension TodoEntityMapper on TodoEntity {
  /// Converts this [TodoEntity] to a [TodoModel].
  ///
  /// If [id] is null, it defaults to 0.
  TodoModel get toModel => TodoModel(
    id: id ?? -1,
    content: content,
    isCompleted: isCompleted,
  );
}

/// Converts a [TodoModel] to a [TodoEntity].
extension TodoModelMapper on TodoModel {
  /// Converts this [TodoModel] to a [TodoEntity].
  TodoEntity get toEntity => TodoEntity(
    id: id == -1 ? null : id,
    content: content,
    isCompleted: isCompleted,
  );
}
