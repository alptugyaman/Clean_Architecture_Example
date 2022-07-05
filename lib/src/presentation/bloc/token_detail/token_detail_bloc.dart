import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';
import 'package:tokens/src/domain/usecases/get_token_details.dart';

part 'token_detail_event.dart';
part 'token_detail_state.dart';

class TokenDetailBloc extends Bloc<TokenDetailEvent, TokenDetailState> {
  final GetTokenDetails _getTokenDetails;
  TokenDetailBloc(this._getTokenDetails) : super(TokenDetailInitial()) {
    on<OnTokenDetailFetched>((event, emit) async {
      emit(TokenDetailLoading());
      final result = await _getTokenDetails.getTokenDetail(event.symbol);

      result.fold(
        (failure) => emit(TokenDetailError(failure.message)),
        (data) => emit(TokenDetailHasData(data)),
      );
    });
  }
}
