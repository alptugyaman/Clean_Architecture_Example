import 'package:equatable/equatable.dart';

import 'platform.dart';

class ContractAddress extends Equatable {
  final String? contractAddress;
  final Platform? platform;

  const ContractAddress({this.contractAddress, this.platform});

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [contractAddress, platform];
}
