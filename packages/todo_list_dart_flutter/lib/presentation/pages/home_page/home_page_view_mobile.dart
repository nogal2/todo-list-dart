import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list_dart_core_flutter/todo_list_dart_core_flutter.dart';

import 'home_page_presenter.dart';
import 'home_page_view_model.dart';

class HomePageViewMobile extends StatelessWidget {
  const HomePageViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: const Body(),
    );
  }
}

class Body extends ConsumerWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<HomePageViewModel> asyncValue = ref.watch(
      homePagePresenterProvider,
    );

    final HomePagePresenter presenter = ref.read(
      homePagePresenterProvider.notifier,
    );

    return asyncValue.when(
      data: (HomePageViewModel data) {
        return Column(
          children: <Widget>[
            Expanded(
              child: data.todos.isEmpty
                  ? const Center(
                      child: Text('할 일이 없습니다'),
                    )
                  : ListView.builder(
                      itemCount: data.todos.length,
                      itemBuilder: (BuildContext context, int index) {
                        final TodoModel todo = data.todos[index];
                        return TodoItem(
                          todo: todo,
                          onToggle: () => presenter.updateTodo(todo),
                          onDelete: () => presenter.deleteTodo(todo),
                        );
                      },
                    ),
            ),
            const TodoInputField(),
          ],
        );
      },
      error: (Object error, StackTrace stackTrace) => Column(
        children: <Widget>[
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(Icons.error_outline, size: 48, color: Colors.red),
                  const SizedBox(height: 16),
                  Text(
                    '오류가 발생했습니다',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          const TodoInputField(),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}

class TodoItem extends StatelessWidget {
  const TodoItem({
    super.key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  });

  final TodoModel todo;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.isCompleted,
        onChanged: (_) => onToggle(),
      ),
      title: Text(
        todo.content,
        style: todo.isCompleted
            ? const TextStyle(
                decoration: TextDecoration.lineThrough,
                color: Colors.grey,
              )
            : null,
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () async {
          final bool? confirmed = await showDialog<bool>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('할 일 삭제'),
              content: const Text('이 할 일을 삭제하시겠습니까?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => context.pop(false),
                  child: const Text('취소'),
                ),
                TextButton(
                  onPressed: () => context.pop(true),
                  child: const Text('삭제'),
                ),
              ],
            ),
          );

          if (confirmed ?? false) {
            onDelete();
          }
        },
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty<TodoModel>('todo', todo));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onToggle', onToggle));
    properties.add(ObjectFlagProperty<VoidCallback>.has('onDelete', onDelete));
  }
}

class TodoInputField extends ConsumerWidget {
  const TodoInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<HomePageViewModel> asyncValue = ref.watch(
      homePagePresenterProvider,
    );

    final HomePagePresenter presenter = ref.read(
      homePagePresenterProvider.notifier,
    );

    return asyncValue.when(
      data: (HomePageViewModel viewModel) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: SafeArea(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: viewModel.todoInputController,
                    decoration: const InputDecoration(
                      hintText: '할 일을 입력하세요',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                    onSubmitted: presenter.handleOnSubmit,
                  ),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () => presenter.handleOnSubmit(
                    viewModel.todoInputController.text,
                  ),
                  child: const Icon(Icons.add),
                ),
              ],
            ),
          ),
        );
      },
      error: (Object error, StackTrace stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
