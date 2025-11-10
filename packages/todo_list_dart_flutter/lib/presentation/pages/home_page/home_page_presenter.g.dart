// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_presenter.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(HomePagePresenter)
const homePagePresenterProvider = HomePagePresenterProvider._();

final class HomePagePresenterProvider
    extends $AsyncNotifierProvider<HomePagePresenter, HomePageViewModel> {
  const HomePagePresenterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'homePagePresenterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$homePagePresenterHash();

  @$internal
  @override
  HomePagePresenter create() => HomePagePresenter();
}

String _$homePagePresenterHash() => r'067a707622f158123c826f8f171de7deee5a6cfc';

abstract class _$HomePagePresenter extends $AsyncNotifier<HomePageViewModel> {
  FutureOr<HomePageViewModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<HomePageViewModel>, HomePageViewModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<HomePageViewModel>, HomePageViewModel>,
              AsyncValue<HomePageViewModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
