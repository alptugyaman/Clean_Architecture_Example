import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@entity
class AlertTokens extends Equatable {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final String price;
  final String favDate;

  const AlertTokens({
    this.id,
    required this.name,
    required this.price,
    required this.favDate,
  });

  @override
  List<Object> get props => [id.toString(), name, price, favDate];

  @override
  bool get stringify => true;
}
