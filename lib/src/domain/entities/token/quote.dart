import 'package:equatable/equatable.dart';

import 'usd.dart';

class Quote extends Equatable {
  final Usd? usd;
  const Quote({this.usd});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [usd];
}
