// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StatusModel _$StatusModelFromJson(Map<String, dynamic> json) => StatusModel(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      errorCode: json['error_code'] as int?,
      errorMessage: json['error_message'],
      elapsed: json['elapsed'] as int?,
      creditCount: json['credit_count'] as int?,
      notice: json['notice'],
      totalCount: json['total_count'] as int?,
    );

Map<String, dynamic> _$StatusModelToJson(StatusModel instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'error_code': instance.errorCode,
      'error_message': instance.errorMessage,
      'elapsed': instance.elapsed,
      'credit_count': instance.creditCount,
      'notice': instance.notice,
      'total_count': instance.totalCount,
    };
