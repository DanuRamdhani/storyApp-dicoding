// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ResponseState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStateInitial value) initial,
    required TResult Function(ResponseStateLoading value) loading,
    required TResult Function(ResponseStateLoaded value) loaded,
    required TResult Function(ResponseStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStateInitial value)? initial,
    TResult? Function(ResponseStateLoading value)? loading,
    TResult? Function(ResponseStateLoaded value)? loaded,
    TResult? Function(ResponseStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStateInitial value)? initial,
    TResult Function(ResponseStateLoading value)? loading,
    TResult Function(ResponseStateLoaded value)? loaded,
    TResult Function(ResponseStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseStateCopyWith<$Res> {
  factory $ResponseStateCopyWith(
          ResponseState value, $Res Function(ResponseState) then) =
      _$ResponseStateCopyWithImpl<$Res, ResponseState>;
}

/// @nodoc
class _$ResponseStateCopyWithImpl<$Res, $Val extends ResponseState>
    implements $ResponseStateCopyWith<$Res> {
  _$ResponseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ResponseStateInitialImplCopyWith<$Res> {
  factory _$$ResponseStateInitialImplCopyWith(_$ResponseStateInitialImpl value,
          $Res Function(_$ResponseStateInitialImpl) then) =
      __$$ResponseStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResponseStateInitialImplCopyWithImpl<$Res>
    extends _$ResponseStateCopyWithImpl<$Res, _$ResponseStateInitialImpl>
    implements _$$ResponseStateInitialImplCopyWith<$Res> {
  __$$ResponseStateInitialImplCopyWithImpl(_$ResponseStateInitialImpl _value,
      $Res Function(_$ResponseStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResponseStateInitialImpl implements ResponseStateInitial {
  const _$ResponseStateInitialImpl();

  @override
  String toString() {
    return 'ResponseState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStateInitial value) initial,
    required TResult Function(ResponseStateLoading value) loading,
    required TResult Function(ResponseStateLoaded value) loaded,
    required TResult Function(ResponseStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStateInitial value)? initial,
    TResult? Function(ResponseStateLoading value)? loading,
    TResult? Function(ResponseStateLoaded value)? loaded,
    TResult? Function(ResponseStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStateInitial value)? initial,
    TResult Function(ResponseStateLoading value)? loading,
    TResult Function(ResponseStateLoaded value)? loaded,
    TResult Function(ResponseStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResponseStateInitial implements ResponseState {
  const factory ResponseStateInitial() = _$ResponseStateInitialImpl;
}

/// @nodoc
abstract class _$$ResponseStateLoadingImplCopyWith<$Res> {
  factory _$$ResponseStateLoadingImplCopyWith(_$ResponseStateLoadingImpl value,
          $Res Function(_$ResponseStateLoadingImpl) then) =
      __$$ResponseStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResponseStateLoadingImplCopyWithImpl<$Res>
    extends _$ResponseStateCopyWithImpl<$Res, _$ResponseStateLoadingImpl>
    implements _$$ResponseStateLoadingImplCopyWith<$Res> {
  __$$ResponseStateLoadingImplCopyWithImpl(_$ResponseStateLoadingImpl _value,
      $Res Function(_$ResponseStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResponseStateLoadingImpl implements ResponseStateLoading {
  const _$ResponseStateLoadingImpl();

  @override
  String toString() {
    return 'ResponseState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStateInitial value) initial,
    required TResult Function(ResponseStateLoading value) loading,
    required TResult Function(ResponseStateLoaded value) loaded,
    required TResult Function(ResponseStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStateInitial value)? initial,
    TResult? Function(ResponseStateLoading value)? loading,
    TResult? Function(ResponseStateLoaded value)? loaded,
    TResult? Function(ResponseStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStateInitial value)? initial,
    TResult Function(ResponseStateLoading value)? loading,
    TResult Function(ResponseStateLoaded value)? loaded,
    TResult Function(ResponseStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResponseStateLoading implements ResponseState {
  const factory ResponseStateLoading() = _$ResponseStateLoadingImpl;
}

/// @nodoc
abstract class _$$ResponseStateLoadedImplCopyWith<$Res> {
  factory _$$ResponseStateLoadedImplCopyWith(_$ResponseStateLoadedImpl value,
          $Res Function(_$ResponseStateLoadedImpl) then) =
      __$$ResponseStateLoadedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResponseStateLoadedImplCopyWithImpl<$Res>
    extends _$ResponseStateCopyWithImpl<$Res, _$ResponseStateLoadedImpl>
    implements _$$ResponseStateLoadedImplCopyWith<$Res> {
  __$$ResponseStateLoadedImplCopyWithImpl(_$ResponseStateLoadedImpl _value,
      $Res Function(_$ResponseStateLoadedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResponseStateLoadedImpl implements ResponseStateLoaded {
  const _$ResponseStateLoadedImpl();

  @override
  String toString() {
    return 'ResponseState.loaded()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResponseStateLoadedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStateInitial value) initial,
    required TResult Function(ResponseStateLoading value) loading,
    required TResult Function(ResponseStateLoaded value) loaded,
    required TResult Function(ResponseStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStateInitial value)? initial,
    TResult? Function(ResponseStateLoading value)? loading,
    TResult? Function(ResponseStateLoaded value)? loaded,
    TResult? Function(ResponseStateError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStateInitial value)? initial,
    TResult Function(ResponseStateLoading value)? loading,
    TResult Function(ResponseStateLoaded value)? loaded,
    TResult Function(ResponseStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ResponseStateLoaded implements ResponseState {
  const factory ResponseStateLoaded() = _$ResponseStateLoadedImpl;
}

/// @nodoc
abstract class _$$ResponseStateErrorImplCopyWith<$Res> {
  factory _$$ResponseStateErrorImplCopyWith(_$ResponseStateErrorImpl value,
          $Res Function(_$ResponseStateErrorImpl) then) =
      __$$ResponseStateErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResponseStateErrorImplCopyWithImpl<$Res>
    extends _$ResponseStateCopyWithImpl<$Res, _$ResponseStateErrorImpl>
    implements _$$ResponseStateErrorImplCopyWith<$Res> {
  __$$ResponseStateErrorImplCopyWithImpl(_$ResponseStateErrorImpl _value,
      $Res Function(_$ResponseStateErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ResponseStateErrorImpl implements ResponseStateError {
  const _$ResponseStateErrorImpl();

  @override
  String toString() {
    return 'ResponseState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResponseStateErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResponseStateInitial value) initial,
    required TResult Function(ResponseStateLoading value) loading,
    required TResult Function(ResponseStateLoaded value) loaded,
    required TResult Function(ResponseStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResponseStateInitial value)? initial,
    TResult? Function(ResponseStateLoading value)? loading,
    TResult? Function(ResponseStateLoaded value)? loaded,
    TResult? Function(ResponseStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResponseStateInitial value)? initial,
    TResult Function(ResponseStateLoading value)? loading,
    TResult Function(ResponseStateLoaded value)? loaded,
    TResult Function(ResponseStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResponseStateError implements ResponseState {
  const factory ResponseStateError() = _$ResponseStateErrorImpl;
}
