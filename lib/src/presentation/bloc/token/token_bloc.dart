import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokens/src/domain/entities/token/listings.dart';
import 'package:tokens/src/domain/usecases/get_all_tokens.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  bool more = true;
  final int _pageSize = 50;
  int _page = 1;
  bool _didFetch = false;
  Listings? listings;

  final GetAllTokens _getAllTokens;
  TokenBloc(this._getAllTokens) : super(TokenInitial()) {
    on<OnTokensFetched>((event, emit) async {
      emit(TokenLoading());
      if (_didFetch) return;
      _didFetch = true;

      final result = await _getAllTokens.execute(_page, _pageSize);

      result.fold(
        (failure) => emit(TokenError(failure.message)),
        (data) {
          if (listings == null) {
            listings = data;
          } else {
            listings!.token!.addAll(data.token!);
          }
          emit(TokenHasData(listings!));
          _page += _pageSize;
          _didFetch = false;
        },
      );
    });
  }
}
