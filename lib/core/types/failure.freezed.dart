// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Failure {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Failure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure()';
  }
}

/// @nodoc
class $FailureCopyWith<$Res> {
  $FailureCopyWith(Failure _, $Res Function(Failure) __);
}

/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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
    TResult Function(ServerFailure value)? serverFailure,
    TResult Function(CacheFailure value)? cacheFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverFailure != null:
        return serverFailure(_that);
      case CacheFailure() when cacheFailure != null:
        return cacheFailure(_that);
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
    required TResult Function(ServerFailure value) serverFailure,
    required TResult Function(CacheFailure value) cacheFailure,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure():
        return serverFailure(_that);
      case CacheFailure():
        return cacheFailure(_that);
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
    TResult? Function(ServerFailure value)? serverFailure,
    TResult? Function(CacheFailure value)? cacheFailure,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverFailure != null:
        return serverFailure(_that);
      case CacheFailure() when cacheFailure != null:
        return cacheFailure(_that);
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
    TResult Function()? serverFailure,
    TResult Function()? cacheFailure,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverFailure != null:
        return serverFailure();
      case CacheFailure() when cacheFailure != null:
        return cacheFailure();
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
    required TResult Function() serverFailure,
    required TResult Function() cacheFailure,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure():
        return serverFailure();
      case CacheFailure():
        return cacheFailure();
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
    TResult? Function()? serverFailure,
    TResult? Function()? cacheFailure,
  }) {
    final _that = this;
    switch (_that) {
      case ServerFailure() when serverFailure != null:
        return serverFailure();
      case CacheFailure() when cacheFailure != null:
        return cacheFailure();
      case _:
        return null;
    }
  }
}

/// @nodoc

class ServerFailure implements Failure {
  const ServerFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ServerFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.serverFailure()';
  }
}

/// @nodoc

class CacheFailure implements Failure {
  const CacheFailure();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CacheFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'Failure.cacheFailure()';
  }
}

// dart format on
