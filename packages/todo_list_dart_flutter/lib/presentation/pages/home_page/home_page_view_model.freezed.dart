// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_page_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomePageViewModel {

 List<TodoModel> get todos;
/// Create a copy of HomePageViewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomePageViewModelCopyWith<HomePageViewModel> get copyWith => _$HomePageViewModelCopyWithImpl<HomePageViewModel>(this as HomePageViewModel, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomePageViewModel&&const DeepCollectionEquality().equals(other.todos, todos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(todos));

@override
String toString() {
  return 'HomePageViewModel(todos: $todos)';
}


}

/// @nodoc
abstract mixin class $HomePageViewModelCopyWith<$Res>  {
  factory $HomePageViewModelCopyWith(HomePageViewModel value, $Res Function(HomePageViewModel) _then) = _$HomePageViewModelCopyWithImpl;
@useResult
$Res call({
 List<TodoModel> todos
});




}
/// @nodoc
class _$HomePageViewModelCopyWithImpl<$Res>
    implements $HomePageViewModelCopyWith<$Res> {
  _$HomePageViewModelCopyWithImpl(this._self, this._then);

  final HomePageViewModel _self;
  final $Res Function(HomePageViewModel) _then;

/// Create a copy of HomePageViewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todos = null,}) {
  return _then(_self.copyWith(
todos: null == todos ? _self.todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [HomePageViewModel].
extension HomePageViewModelPatterns on HomePageViewModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomePageViewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomePageViewModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomePageViewModel value)  $default,){
final _that = this;
switch (_that) {
case _HomePageViewModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomePageViewModel value)?  $default,){
final _that = this;
switch (_that) {
case _HomePageViewModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<TodoModel> todos)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomePageViewModel() when $default != null:
return $default(_that.todos);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<TodoModel> todos)  $default,) {final _that = this;
switch (_that) {
case _HomePageViewModel():
return $default(_that.todos);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<TodoModel> todos)?  $default,) {final _that = this;
switch (_that) {
case _HomePageViewModel() when $default != null:
return $default(_that.todos);case _:
  return null;

}
}

}

/// @nodoc


class _HomePageViewModel implements HomePageViewModel {
  const _HomePageViewModel({final  List<TodoModel> todos = const <TodoModel>[]}): _todos = todos;
  

 final  List<TodoModel> _todos;
@override@JsonKey() List<TodoModel> get todos {
  if (_todos is EqualUnmodifiableListView) return _todos;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_todos);
}


/// Create a copy of HomePageViewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomePageViewModelCopyWith<_HomePageViewModel> get copyWith => __$HomePageViewModelCopyWithImpl<_HomePageViewModel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomePageViewModel&&const DeepCollectionEquality().equals(other._todos, _todos));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_todos));

@override
String toString() {
  return 'HomePageViewModel(todos: $todos)';
}


}

/// @nodoc
abstract mixin class _$HomePageViewModelCopyWith<$Res> implements $HomePageViewModelCopyWith<$Res> {
  factory _$HomePageViewModelCopyWith(_HomePageViewModel value, $Res Function(_HomePageViewModel) _then) = __$HomePageViewModelCopyWithImpl;
@override @useResult
$Res call({
 List<TodoModel> todos
});




}
/// @nodoc
class __$HomePageViewModelCopyWithImpl<$Res>
    implements _$HomePageViewModelCopyWith<$Res> {
  __$HomePageViewModelCopyWithImpl(this._self, this._then);

  final _HomePageViewModel _self;
  final $Res Function(_HomePageViewModel) _then;

/// Create a copy of HomePageViewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todos = null,}) {
  return _then(_HomePageViewModel(
todos: null == todos ? _self._todos : todos // ignore: cast_nullable_to_non_nullable
as List<TodoModel>,
  ));
}


}

// dart format on
