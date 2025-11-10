import '../models/models.dart';

abstract class TodoRepository {
  /// 새 Todo를 생성합니다.
  Future<TodoModel> create(TodoModel todo);

  /// 모든 Todo를 조회합니다.
  Future<List<TodoModel>> getAll();

  /// 업데이트합니다.
  Future<TodoModel> update(TodoModel todo);

  /// ID로 Todo를 삭제합니다.
  Future<void> deleteById(TodoModel todo);
}
