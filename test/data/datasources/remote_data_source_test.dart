import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:tokens/src/core/contants/url_contants.dart';

void main() {
  late Dio dio;
  late DioAdapter dioAdapter;

  setUp(() {
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
    dio = Dio();
    dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;
  });

  group('get current weather', () {
    test(
      'should return listings model when the response code is 200',
      () async {
        dioAdapter.onGet(
          UrlContants.listings,
          (request) => request.reply(200, {'message': 'Done'}),
        );

        final response = await dio.get(
          UrlContants.listings,
          queryParameters: {'start': 1, 'limit': 10, 'convert': 'USD'},
        );

        expect(response.statusCode, 200);
      },
    );
  });
}
