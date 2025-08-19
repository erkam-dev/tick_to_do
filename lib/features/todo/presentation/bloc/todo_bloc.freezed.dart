// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoEvent()';
  }
}

/// @nodoc
class $TodoEventCopyWith<$Res> {
  $TodoEventCopyWith(TodoEvent _, $Res Function(TodoEvent) __);
}

/// Adds pattern-matching-related methods to [TodoEvent].
extension TodoEventPatterns on TodoEvent {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddTodoItem value)? addTodoItem,
    TResult Function(_UpdateTodoItem value)? updateTodoItem,
    TResult Function(_DeleteTodoItem value)? deleteTodoItem,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddTodoItem() when addTodoItem != null:
        return addTodoItem(_that);
      case _UpdateTodoItem() when updateTodoItem != null:
        return updateTodoItem(_that);
      case _DeleteTodoItem() when deleteTodoItem != null:
        return deleteTodoItem(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddTodoItem value) addTodoItem,
    required TResult Function(_UpdateTodoItem value) updateTodoItem,
    required TResult Function(_DeleteTodoItem value) deleteTodoItem,
  }) {
    final _that = this;
    switch (_that) {
      case _AddTodoItem():
        return addTodoItem(_that);
      case _UpdateTodoItem():
        return updateTodoItem(_that);
      case _DeleteTodoItem():
        return deleteTodoItem(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddTodoItem value)? addTodoItem,
    TResult? Function(_UpdateTodoItem value)? updateTodoItem,
    TResult? Function(_DeleteTodoItem value)? deleteTodoItem,
  }) {
    final _that = this;
    switch (_that) {
      case _AddTodoItem() when addTodoItem != null:
        return addTodoItem(_that);
      case _UpdateTodoItem() when updateTodoItem != null:
        return updateTodoItem(_that);
      case _DeleteTodoItem() when deleteTodoItem != null:
        return deleteTodoItem(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Todo todo)? addTodoItem,
    TResult Function(Todo todo)? updateTodoItem,
    TResult Function(String id)? deleteTodoItem,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AddTodoItem() when addTodoItem != null:
        return addTodoItem(_that.todo);
      case _UpdateTodoItem() when updateTodoItem != null:
        return updateTodoItem(_that.todo);
      case _DeleteTodoItem() when deleteTodoItem != null:
        return deleteTodoItem(_that.id);
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Todo todo) addTodoItem,
    required TResult Function(Todo todo) updateTodoItem,
    required TResult Function(String id) deleteTodoItem,
  }) {
    final _that = this;
    switch (_that) {
      case _AddTodoItem():
        return addTodoItem(_that.todo);
      case _UpdateTodoItem():
        return updateTodoItem(_that.todo);
      case _DeleteTodoItem():
        return deleteTodoItem(_that.id);
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Todo todo)? addTodoItem,
    TResult? Function(Todo todo)? updateTodoItem,
    TResult? Function(String id)? deleteTodoItem,
  }) {
    final _that = this;
    switch (_that) {
      case _AddTodoItem() when addTodoItem != null:
        return addTodoItem(_that.todo);
      case _UpdateTodoItem() when updateTodoItem != null:
        return updateTodoItem(_that.todo);
      case _DeleteTodoItem() when deleteTodoItem != null:
        return deleteTodoItem(_that.id);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _AddTodoItem implements TodoEvent {
  const _AddTodoItem(this.todo);

  final Todo todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AddTodoItemCopyWith<_AddTodoItem> get copyWith =>
      __$AddTodoItemCopyWithImpl<_AddTodoItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AddTodoItem &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @override
  String toString() {
    return 'TodoEvent.addTodoItem(todo: $todo)';
  }
}

/// @nodoc
abstract mixin class _$AddTodoItemCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory _$AddTodoItemCopyWith(
          _AddTodoItem value, $Res Function(_AddTodoItem) _then) =
      __$AddTodoItemCopyWithImpl;
  @useResult
  $Res call({Todo todo});
}

/// @nodoc
class __$AddTodoItemCopyWithImpl<$Res> implements _$AddTodoItemCopyWith<$Res> {
  __$AddTodoItemCopyWithImpl(this._self, this._then);

  final _AddTodoItem _self;
  final $Res Function(_AddTodoItem) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todo = null,
  }) {
    return _then(_AddTodoItem(
      null == todo
          ? _self.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }
}

/// @nodoc

class _UpdateTodoItem implements TodoEvent {
  const _UpdateTodoItem(this.todo);

  final Todo todo;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UpdateTodoItemCopyWith<_UpdateTodoItem> get copyWith =>
      __$UpdateTodoItemCopyWithImpl<_UpdateTodoItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UpdateTodoItem &&
            (identical(other.todo, todo) || other.todo == todo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, todo);

  @override
  String toString() {
    return 'TodoEvent.updateTodoItem(todo: $todo)';
  }
}

/// @nodoc
abstract mixin class _$UpdateTodoItemCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory _$UpdateTodoItemCopyWith(
          _UpdateTodoItem value, $Res Function(_UpdateTodoItem) _then) =
      __$UpdateTodoItemCopyWithImpl;
  @useResult
  $Res call({Todo todo});
}

/// @nodoc
class __$UpdateTodoItemCopyWithImpl<$Res>
    implements _$UpdateTodoItemCopyWith<$Res> {
  __$UpdateTodoItemCopyWithImpl(this._self, this._then);

  final _UpdateTodoItem _self;
  final $Res Function(_UpdateTodoItem) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todo = null,
  }) {
    return _then(_UpdateTodoItem(
      null == todo
          ? _self.todo
          : todo // ignore: cast_nullable_to_non_nullable
              as Todo,
    ));
  }
}

/// @nodoc

class _DeleteTodoItem implements TodoEvent {
  const _DeleteTodoItem(this.id);

  final String id;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$DeleteTodoItemCopyWith<_DeleteTodoItem> get copyWith =>
      __$DeleteTodoItemCopyWithImpl<_DeleteTodoItem>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _DeleteTodoItem &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  String toString() {
    return 'TodoEvent.deleteTodoItem(id: $id)';
  }
}

/// @nodoc
abstract mixin class _$DeleteTodoItemCopyWith<$Res>
    implements $TodoEventCopyWith<$Res> {
  factory _$DeleteTodoItemCopyWith(
          _DeleteTodoItem value, $Res Function(_DeleteTodoItem) _then) =
      __$DeleteTodoItemCopyWithImpl;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$DeleteTodoItemCopyWithImpl<$Res>
    implements _$DeleteTodoItemCopyWith<$Res> {
  __$DeleteTodoItemCopyWithImpl(this._self, this._then);

  final _DeleteTodoItem _self;
  final $Res Function(_DeleteTodoItem) _then;

  /// Create a copy of TodoEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
  }) {
    return _then(_DeleteTodoItem(
      null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TodoState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TodoState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState()';
  }
}

/// @nodoc
class $TodoStateCopyWith<$Res> {
  $TodoStateCopyWith(TodoState _, $Res Function(TodoState) __);
}

/// Adds pattern-matching-related methods to [TodoState].
extension TodoStatePatterns on TodoState {
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

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Error():
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Error() when error != null:
        return error(_that);
      case _:
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

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Todo>? todos, List<Todo>? completed)? initial,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.todos, _that.completed);
      case _Loading() when loading != null:
        return loading();
      case _Error() when error != null:
        return error();
      case _:
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

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Todo>? todos, List<Todo>? completed) initial,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that.todos, _that.completed);
      case _Loading():
        return loading();
      case _Error():
        return error();
      case _:
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

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Todo>? todos, List<Todo>? completed)? initial,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that.todos, _that.completed);
      case _Loading() when loading != null:
        return loading();
      case _Error() when error != null:
        return error();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements TodoState {
  const _Initial([final List<Todo>? todos, final List<Todo>? completed])
      : _todos = todos,
        _completed = completed;

  final List<Todo>? _todos;
  List<Todo>? get todos {
    final value = _todos;
    if (value == null) return null;
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Todo>? _completed;
  List<Todo>? get completed {
    final value = _completed;
    if (value == null) return null;
    if (_completed is EqualUnmodifiableListView) return _completed;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InitialCopyWith<_Initial> get copyWith =>
      __$InitialCopyWithImpl<_Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Initial &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            const DeepCollectionEquality()
                .equals(other._completed, _completed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_todos),
      const DeepCollectionEquality().hash(_completed));

  @override
  String toString() {
    return 'TodoState.initial(todos: $todos, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$InitialCopyWith<$Res>
    implements $TodoStateCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) _then) =
      __$InitialCopyWithImpl;
  @useResult
  $Res call({List<Todo>? todos, List<Todo>? completed});
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(this._self, this._then);

  final _Initial _self;
  final $Res Function(_Initial) _then;

  /// Create a copy of TodoState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? todos = freezed,
    Object? completed = freezed,
  }) {
    return _then(_Initial(
      freezed == todos
          ? _self._todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
      freezed == completed
          ? _self._completed
          : completed // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ));
  }
}

/// @nodoc

class _Loading implements TodoState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState.loading()';
  }
}

/// @nodoc

class _Error implements TodoState {
  const _Error();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Error);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TodoState.error()';
  }
}

// dart format on
