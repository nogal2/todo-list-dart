import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list_dart_core_flutter/todo_list_dart_core_flutter.dart';

part 'home_page_view_model.freezed.dart';

@freezed
abstract class HomePageViewModel with _$HomePageViewModel {
  const factory HomePageViewModel({
    @Default(<TodoModel>[]) List<TodoModel> todos,
  }) = _HomePageViewModel;
}
