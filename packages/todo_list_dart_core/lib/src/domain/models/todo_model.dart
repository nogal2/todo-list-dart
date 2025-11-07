import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_model.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  TodoModel({
    required this.id,
    required this.content,
    required this.isCompleted,
  });

  @override
  final int id;
  @override
  final String content;
  @override
  final bool isCompleted;
}
