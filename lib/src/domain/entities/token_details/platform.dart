import 'package:equatable/equatable.dart';

import 'coin.dart';

class Platform extends Equatable {
  final String? name;
  final Coin? coin;

  const Platform({this.name, this.coin});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, coin];
}
