import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token/status.dart';

part 'status_model.g.dart';

@JsonSerializable()
class StatusModel extends Equatable {
  final DateTime? timestamp;
  @JsonKey(name: 'error_code')
  final int? errorCode;
  @JsonKey(name: 'error_message')
  final dynamic errorMessage;
  final int? elapsed;
  @JsonKey(name: 'credit_count')
  final int? creditCount;
  final dynamic notice;
  @JsonKey(name: 'total_count')
  final int? totalCount;

  const StatusModel({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  });

  factory StatusModel.fromJson(Map<String, dynamic> json) {
    return _$StatusModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$StatusModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      timestamp,
      errorCode,
      errorMessage,
      elapsed,
      creditCount,
      notice,
      totalCount,
    ];
  }

  Status toEntity() => Status(
        timestamp: timestamp,
        errorCode: errorCode,
        errorMessage: errorMessage,
        elapsed: elapsed,
        creditCount: creditCount,
        notice: notice,
        totalCount: totalCount,
      );
}
