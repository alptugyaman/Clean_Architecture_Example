import 'package:equatable/equatable.dart';

class Coin extends Equatable {
  final String? id;
  final String? name;
  final String? symbol;
  final String? slug;

  const Coin({this.id, this.name, this.symbol, this.slug});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, symbol, slug];
}
