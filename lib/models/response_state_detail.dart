import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_state_detail.freezed.dart';

@freezed
class ResponseStateDetail with _$ResponseStateDetail {
  const factory ResponseStateDetail.initial() = ResponseStateDetailInitial;
  const factory ResponseStateDetail.loading() = ResponseStateDetailLoading;
  const factory ResponseStateDetail.loaded() = ResponseStateDetailLoaded;
  const factory ResponseStateDetail.error() = ResponseStateDetailError;
}
