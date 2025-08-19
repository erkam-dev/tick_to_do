// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent()';
  }
}

/// @nodoc
class $AuthEventCopyWith<$Res> {
  $AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}

/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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
    TResult Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult Function(_GetAuthStatusStream value)? getAuthStatusStream,
    TResult Function(_SignOut value)? signOut,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignInWithGoogle() when signInWithGoogle != null:
        return signInWithGoogle(_that);
      case _GetAuthStatusStream() when getAuthStatusStream != null:
        return getAuthStatusStream(_that);
      case _SignOut() when signOut != null:
        return signOut(_that);
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount(_that);
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
    required TResult Function(_SignInWithGoogle value) signInWithGoogle,
    required TResult Function(_GetAuthStatusStream value) getAuthStatusStream,
    required TResult Function(_SignOut value) signOut,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _SignInWithGoogle():
        return signInWithGoogle(_that);
      case _GetAuthStatusStream():
        return getAuthStatusStream(_that);
      case _SignOut():
        return signOut(_that);
      case _DeleteAccount():
        return deleteAccount(_that);
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
    TResult? Function(_SignInWithGoogle value)? signInWithGoogle,
    TResult? Function(_GetAuthStatusStream value)? getAuthStatusStream,
    TResult? Function(_SignOut value)? signOut,
    TResult? Function(_DeleteAccount value)? deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _SignInWithGoogle() when signInWithGoogle != null:
        return signInWithGoogle(_that);
      case _GetAuthStatusStream() when getAuthStatusStream != null:
        return getAuthStatusStream(_that);
      case _SignOut() when signOut != null:
        return signOut(_that);
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount(_that);
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
    TResult Function()? signInWithGoogle,
    TResult Function()? getAuthStatusStream,
    TResult Function()? signOut,
    TResult Function()? deleteAccount,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SignInWithGoogle() when signInWithGoogle != null:
        return signInWithGoogle();
      case _GetAuthStatusStream() when getAuthStatusStream != null:
        return getAuthStatusStream();
      case _SignOut() when signOut != null:
        return signOut();
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount();
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
    required TResult Function() signInWithGoogle,
    required TResult Function() getAuthStatusStream,
    required TResult Function() signOut,
    required TResult Function() deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _SignInWithGoogle():
        return signInWithGoogle();
      case _GetAuthStatusStream():
        return getAuthStatusStream();
      case _SignOut():
        return signOut();
      case _DeleteAccount():
        return deleteAccount();
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
    TResult? Function()? signInWithGoogle,
    TResult? Function()? getAuthStatusStream,
    TResult? Function()? signOut,
    TResult? Function()? deleteAccount,
  }) {
    final _that = this;
    switch (_that) {
      case _SignInWithGoogle() when signInWithGoogle != null:
        return signInWithGoogle();
      case _GetAuthStatusStream() when getAuthStatusStream != null:
        return getAuthStatusStream();
      case _SignOut() when signOut != null:
        return signOut();
      case _DeleteAccount() when deleteAccount != null:
        return deleteAccount();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _SignInWithGoogle implements AuthEvent {
  const _SignInWithGoogle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignInWithGoogle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.signInWithGoogle()';
  }
}

/// @nodoc

class _GetAuthStatusStream implements AuthEvent {
  const _GetAuthStatusStream();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GetAuthStatusStream);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.getAuthStatusStream()';
  }
}

/// @nodoc

class _SignOut implements AuthEvent {
  const _SignOut();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.signOut()';
  }
}

/// @nodoc

class _DeleteAccount implements AuthEvent {
  const _DeleteAccount();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _DeleteAccount);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthEvent.deleteAccount()';
  }
}

/// @nodoc
mixin _$AuthState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is AuthState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState()';
  }
}

/// @nodoc
class $AuthStateCopyWith<$Res> {
  $AuthStateCopyWith(AuthState _, $Res Function(AuthState) __);
}

/// Adds pattern-matching-related methods to [AuthState].
extension AuthStatePatterns on AuthState {
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
    TResult Function(_SignedOut value)? signedOut,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _SignedOut() when signedOut != null:
        return signedOut(_that);
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
    required TResult Function(_SignedOut value) signedOut,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _SignedOut():
        return signedOut(_that);
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
    TResult? Function(_SignedOut value)? signedOut,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _SignedOut() when signedOut != null:
        return signedOut(_that);
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
    TResult Function()? initial,
    TResult Function()? signedOut,
    TResult Function()? loading,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _SignedOut() when signedOut != null:
        return signedOut();
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
    required TResult Function() initial,
    required TResult Function() signedOut,
    required TResult Function() loading,
    required TResult Function() error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _SignedOut():
        return signedOut();
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
    TResult? Function()? initial,
    TResult? Function()? signedOut,
    TResult? Function()? loading,
    TResult? Function()? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _SignedOut() when signedOut != null:
        return signedOut();
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

class _Initial implements AuthState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.initial()';
  }
}

/// @nodoc

class _SignedOut implements AuthState {
  const _SignedOut();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _SignedOut);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'AuthState.signedOut()';
  }
}

/// @nodoc

class _Loading implements AuthState {
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
    return 'AuthState.loading()';
  }
}

/// @nodoc

class _Error implements AuthState {
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
    return 'AuthState.error()';
  }
}

// dart format on
