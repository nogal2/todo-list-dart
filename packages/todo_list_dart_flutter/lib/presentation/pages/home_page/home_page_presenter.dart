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
    return HomePageViewModel(todos: todos);
  }
}
