/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class TodoEntity implements _i1.SerializableModel {
  TodoEntity._({
    this.id,
    required this.content,
    required this.isCompleted,
  });

  factory TodoEntity({
    int? id,
    required String content,
    required bool isCompleted,
  }) = _TodoEntityImpl;

  factory TodoEntity.fromJson(Map<String, dynamic> jsonSerialization) {
    return TodoEntity(
      id: jsonSerialization['id'] as int?,
      content: jsonSerialization['content'] as String,
      isCompleted: jsonSerialization['isCompleted'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  String content;

  bool isCompleted;

  /// Returns a shallow copy of this [TodoEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  TodoEntity copyWith({
    int? id,
    String? content,
    bool? isCompleted,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'content': content,
      'isCompleted': isCompleted,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _TodoEntityImpl extends TodoEntity {
  _TodoEntityImpl({
    int? id,
    required String content,
    required bool isCompleted,
  }) : super._(
          id: id,
          content: content,
          isCompleted: isCompleted,
        );

  /// Returns a shallow copy of this [TodoEntity]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  TodoEntity copyWith({
    Object? id = _Undefined,
    String? content,
    bool? isCompleted,
  }) {
    return TodoEntity(
      id: id is int? ? id : this.id,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
