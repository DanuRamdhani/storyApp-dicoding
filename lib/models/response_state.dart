import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_state.freezed.dart';

@freezed
class ResponseState with _$ResponseState {
  const factory ResponseState.initial() = ResponseStateInitial;
  const factory ResponseState.loading() = ResponseStateLoading;
  const factory ResponseState.loaded() = ResponseStateLoaded;
  const factory ResponseState.error() = ResponseStateError;
}
