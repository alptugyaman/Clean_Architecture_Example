import 'package:dio/dio.dart';
import 'package:tokens/src/core/contants/url_contants.dart';
import 'package:tokens/src/core/network/network_manager.dart';
import 'package:tokens/src/data/models/token/listings_model.dart';
import 'package:tokens/src/data/models/token_details/token_detail_model.dart';

abstract class RemoteDataSource {
  Future<ListingsModel> getAllTokens(int page, int pageSize);
  Future<TokenDetailModel> getTokenDetails(String symbol);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  NetworkManager networkManager;
  RemoteDataSourceImpl({required this.networkManager});

  @override
  Future<ListingsModel> getAllTokens(int page, int pageSize) async {
    try {
      final response = await networkManager.dio.get(
        UrlContants.listings,
        queryParameters: {'start': page, 'limit': pageSize, 'convert': 'USD'},
      );

      final listingsModel = ListingsModel.fromJson(response.data);

      return listingsModel;
    } on Exception catch (_) {
      rethrow;
    }
  }

  @override
  Future<TokenDetailModel> getTokenDetails(String symbol) async {
    final Response response = await networkManager.dio.get(
      UrlContants.info,
      queryParameters: {'symbol': symbol},
    );

//! NEEDED For Nested symbol
    final tokenDetail =
        TokenDetailModel.fromJson(response.data['data'][symbol]);

    return tokenDetail;
  }
}
