import 'package:equatable/equatable.dart';

class Status extends Equatable {
  final DateTime? timestamp;
  final int? errorCode;
  final dynamic errorMessage;
  final int? elapsed;
  final int? creditCount;
  final dynamic notice;
  final int? totalCount;

  const Status({
    this.timestamp,
    this.errorCode,
    this.errorMessage,
    this.elapsed,
    this.creditCount,
    this.notice,
    this.totalCount,
  });

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
}
