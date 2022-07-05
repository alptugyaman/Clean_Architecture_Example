part of 'token_bloc.dart';

abstract class TokenEvent extends Equatable {
  const TokenEvent();

  @override
  List<Object> get props => [];
}

class OnTokensFetched extends TokenEvent {
  const OnTokensFetched();

  @override
  List<Object> get props => [];
}
