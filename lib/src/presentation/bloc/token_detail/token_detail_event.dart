part of 'token_detail_bloc.dart';

abstract class TokenDetailEvent extends Equatable {
  const TokenDetailEvent();

  @override
  List<Object> get props => [];
}

class OnTokenDetailFetched extends TokenDetailEvent {
  const OnTokenDetailFetched(this.symbol);
  final String symbol;

  @override
  List<Object> get props => [];
}
