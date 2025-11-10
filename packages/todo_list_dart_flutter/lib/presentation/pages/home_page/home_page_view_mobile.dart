import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home_page_presenter.dart';
import 'home_page_view_model.dart';

class HomePageViewMobile extends StatelessWidget {
  const HomePageViewMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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

    return asyncValue.when(
      data: (HomePageViewModel data) {
        if (data.todos.isEmpty) {
          return const Center(
            child: Text('할 일이 없습니다'),
          );
        }
        return ListView.builder(
          itemCount: data.todos.length,
          itemBuilder: (BuildContext context, int index) =>
              Text(data.todos[index].content),
        );
      },
      error: (Object error, StackTrace stackTrace) => Text(error.toString()),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
