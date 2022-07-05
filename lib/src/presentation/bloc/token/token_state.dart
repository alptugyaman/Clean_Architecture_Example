part of 'token_bloc.dart';

abstract class TokenState extends Equatable {
  const TokenState();

  @override
  List<Object> get props => [];
}

class TokenInitial extends TokenState {}

class TokenLoading extends TokenState {}

class TokenEmpty extends TokenState {}

class TokenError extends TokenState {
  final String message;
  const TokenError(this.message);

  @override
  List<Object> get props => [message];
}

class TokenHasData extends TokenState {
  final Listings listings;
  const TokenHasData(this.listings);

  @override
  List<Object> get props => [listings];
}
