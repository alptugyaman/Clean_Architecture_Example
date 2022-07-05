part of 'token_detail_bloc.dart';

abstract class TokenDetailState extends Equatable {
  const TokenDetailState();

  @override
  List<Object> get props => [];
}

class TokenDetailInitial extends TokenDetailState {}

class TokenDetailLoading extends TokenDetailState {}

class TokenDetailError extends TokenDetailState {
  final String message;
  const TokenDetailError(this.message);

  @override
  List<Object> get props => [message];
}

class TokenDetailHasData extends TokenDetailState {
  final TokenDetail tokenDetail;
  const TokenDetailHasData(this.tokenDetail);

  @override
  List<Object> get props => [tokenDetail];
}
