import 'package:equatable/equatable.dart';

import 'token.dart';
import 'status.dart';

class Listings extends Equatable {
  final Status? status;
  final List<Token>? token;

  const Listings({this.status, this.token});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, token];
}
