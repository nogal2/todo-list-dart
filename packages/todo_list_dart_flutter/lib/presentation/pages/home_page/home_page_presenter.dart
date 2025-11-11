import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:todo_list_dart_core_flutter/todo_list_dart_core_flutter.dart';

import 'home_page_view_model.dart';

part 'home_page_presenter.g.dart';

@riverpod
class HomePagePresenter extends _$HomePagePresenter {
  final TodoRepository todoRepository = TodoRepositoryServerpod();

  @override
  Future<HomePageViewModel> build() async {
    final List<TodoModel> todos = await todoRepository.getAll();
    return HomePageViewModel(
      todos: todos,
      todoInputController: TextEditingController(),
    );
  }

  Future<void> handleAddTodo(String content) async {
    if (!state.hasValue && content.trim().isEmpty) {
      return;
    }

    final HomePageViewModel viewModel = state.value!;

    state = await AsyncValue.guard(() async {
      final TodoModel newTodo = TodoModel(
        content: content.trim(),
      );
      await todoRepository.create(newTodo);
      final List<TodoModel> todos = await todoRepository.getAll();
      return viewModel.copyWith(todos: todos);
    });
  }

  Future<void> handleUpdateTodo(TodoModel todo) async {
    if (!state.hasValue) {
      return;
    }

    final HomePageViewModel viewModel = state.value!;

    state = await AsyncValue.guard(() async {
      final TodoModel updatedTodo = todo.copyWith(
        isCompleted: !todo.isCompleted,
      );
      await todoRepository.update(updatedTodo);
      final List<TodoModel> todos = await todoRepository.getAll();
      return viewModel.copyWith(todos: todos);
    });
  }

  Future<void> handleDeleteTodo(TodoModel todo) async {
    if (!state.hasValue) {
      return;
    }

    final HomePageViewModel viewModel = state.value!;

    state = await AsyncValue.guard(() async {
      await todoRepository.deleteById(todo);
      final List<TodoModel> todos = await todoRepository.getAll();
      return viewModel.copyWith(todos: todos);
    });
  }

  Future<void> handleOnSubmit(String value) async {
    if (value.trim().isNotEmpty) {
      await handleAddTodo(value);
      state.value!.todoInputController.clear();
    }
  }
}
